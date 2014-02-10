module Magicspec
	class MagicspecError < StandardError; end
	class ConfigFileMissingError < MagicspecError; end
	class IncorrectConfigFileError < MagicspecError; end
	class InvalidLazymanPageError < MagicspecError; end
end #Lazyman
