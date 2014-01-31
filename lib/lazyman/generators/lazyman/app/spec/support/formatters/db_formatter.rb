require 'rspec/core/formatters/base_text_formatter'
require 'rspec/core/formatters/base_formatter'

class DBFormatter < RSpec::Core::Formatters::BaseTextFormatter
  def initialize(output)
    super
    output.puts "Starting DB Formatter"
  end

  def start(example_count)
    super
    r = RestClient.post('http://localhost:3000/runs/',
    {:description => "New test #{Time.now.to_s} #{$things}",
      :notes => "Coming together now. #{Time.now.to_s}",
      :app_id => [1,2,3].sample}
    )
    @id = JSON.parse(r)["id"]
  end

  def example_group_started(example_group)
    super
    output.puts "#{example_group.description}"
  end

  def example_pending(example)
    @pending_examples << example
    output.puts "Pending #{example.metadata.find_all_values_for(:description).join(":")}"
    RestClient.post('http://localhost:3000/report_services/',
    {
      :id => @id,
      :description => example.full_description,
      :status => "Pending",
      :path => example.metadata.find_all_values_for(:description).reverse.join(":"),
      :duration => example.metadata[:execution_result][:run_time]
    }
    )
  end

  def example_passed(example)
    super
    output.puts "    * #{example.description}"
    output.puts "Passed: #{example.metadata.find_all_values_for(:description).reverse.join(":")}"

    RestClient.post('http://localhost:3000/report_services/',
    {
      :id => @id,
      :description => example.full_description,
      :status => "Passed",
      :path => example.metadata.find_all_values_for(:description).reverse.join(":"),
      :duration => example.metadata[:execution_result][:run_time]
    }
    )
  end

  def example_failed(example)
    super
    output.puts "    ! #{example.description} (FAILED)"
    output.puts "Exception #{example.exception}"
    output.puts "    #{example.file_path}"
    output.puts "    #{example.location}"
    # Describe plus it
    output.puts "    #{example.full_description}"
    #output.puts "    #{example.metadata}"
    output.puts "    #{example.metadata[:execution_result][:run_time]}"
    output.puts "    #{example.metadata[:execution_result][:finished_at]}"
    
    browser = example_group.before_all_ivars[:@browser] || @browser
    # If we'ere dealing with a browser get a screenshot on failure
    if browser
      @screen = browser.screenshot.base64   
    end
    
    RestClient.post('http://localhost:3000/report_services/',
    {
      :id => @id,
      :description => example.full_description,
      :status => "Failed",
      :path => example.metadata.find_all_values_for(:description).reverse.join(":"),
      :duration => example.metadata[:execution_result][:run_time],
      :exception => example.exception,
      :exception_details => extra_failure_content(example.exception),
      :screenshot => @screen
    }
    )
    
    
  #:example_group
  #output.puts "Failed: #{example.metadata.find_all_values_for(:description).join(":")}"
  #output.puts extra_failure_content(example.exception)
  end

  def extra_failure_content(exception)
    require 'rspec/core/formatters/snippet_extractor'
    backtrace = exception.backtrace.map {|line| backtrace_line(line)}
    backtrace.compact!
    # Chances are there's a better way to do this
    @snippet_extractor ||= RSpec::Core::Formatters::SnippetExtractor.new
    "    <pre class=\"ruby\"><code>#{@snippet_extractor.snippet(backtrace)}</code></pre>"
  end

  def stop
    super
    output.puts "All Done!"
    output.puts @id
  end
end
