module Lazyman
	class Initializer
		def initialize root, app_name
			@root ||= root
			@app_name ||= app_name
			
			@pages_path = File.join(@root, 'app', 'pages')
      $:.unshift(@pages_path)
			
			load_config
			load_all_pages
			generate_pathes
		end
		
		def load_all_pages
			Dir.glob(File.join @pages_path, '**', '*.rb').select { |p| p =~ /page\.rb$/ }.each do |page|
				puts "#{page}" if $debug
				require "#{page}"
			end #each
		end

		def load_config
			# hard code config file name here
			@config_file = File.join @root, 'config', 'config.yml'
			$config = Config.new(@config_file).content  
		end

		def generate_pathes
			$root = @root
			$pages = @pages_path
		end
	end
end #Lazyman
