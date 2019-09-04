# require modules here
require "yaml"

def load_library(file_path)
	library = {"get_meaning" => {}, "get_emoticon" => {}}
	YAML.load_file(file_path).each do |meaning, array|
		english = array[0]
		japanese = array[1]
		library["get_meaning"][japanese] = meaning
		library["get_emoticon"][english] = japanese
	end
	library
		
end

def get_japanese_emoticon(file_path, emote)
	library = load_library(file_path)
	if library["get_emoticon"][emote]
		library["get_emoticon"][emote]
	else
		"Sorry, that emoticon was not found"
	end
end

def get_english_meaning(file_path, emote)
	library = load_library(file_path)
	if library["get_meaning"][emote]
		library["get_meaning"][emote]
	else
		"Sorry, that emoticon was not found"
	end
end