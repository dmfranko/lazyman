require 'thor'

module Magicspec
  class CLI < Thor
    include Thor::Actions

    def self.source_root
      File.join File.dirname(__FILE__)
    end

    def self.source_paths
      [source_root + '/generators', source_root + '/templates']
    end
    
    desc 'new NAME', 'create a magicspec project'
    def new(name)
      @name = name
      if name
        directory 'magicspec', name
      else
        say 'no app name'
      end
    end

    desc 'run ', 'run test case with rspec'
    def start
      ARGV.shift
      puts "rspec #{ARGV.join('')}" if $debug
      run "LOCAL=true rspec"
    end

    # Might just dump the console
    desc 'c ', 'open magicspec console'
    def c
      run 'bin/console'
    end
    
    desc "new_page NAME", "create a new page"
    def new_page(name)
      @name = name
      template('template_page.rb.tt', "./app/pages/#{name}_page.rb")
    end
    

    desc "new_spec NAME ", "create a new spec"
    option :type,:required => false
    method_option :type,
      :default => "browser",
      :aliases => "-t",
      :desc => "which type of template to create [browser,webService,plain]."

    # Could probably stand to DRY this up a bit, but it works fine.
    def new_spec(name)
      @name = name
      case options["type"].downcase
      when "browser"
        template('browser_spec_template.rb.tt', "./app/spec/#{name}_spec.rb")
      when "webservice"
        template('web_service_template.rb.tt', "./app/spec/#{name}_spec.rb")
      when "plain"
        template('plain_template.rb.tt', "./app/spec/#{name}_spec.rb")
      when "mobile"
        template('mobile_template.rb.tt', "./app/spec/#{name}_spec.rb")
      else
        say "Sorry :(. I'm not sure what you're trying to do?"
      end
    end
  end #CLI
  CLI.start
end #Lazyman

