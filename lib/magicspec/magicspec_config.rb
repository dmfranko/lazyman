require 'yaml'
require 'magicspec/errors'
require 'ostruct'

module Magicspec
	class Config
		attr_reader :hash_content, :content
		
		def initialize filepath
			@f ||= filepath if valid?(filepath)
			File.open(@f) {|handle| @content = YAML.load(handle)}
		end
		
		def valid?(filepath)
			raise ConfigFileMissingError unless File.exists?(filepath)
			true
		end

	end
end #Magicspec
