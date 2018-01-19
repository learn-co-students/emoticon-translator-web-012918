# require modules here

require 'yaml'

def load_library(path)
  # code goes here
  loaded = YAML.load_file(path)
  hash = {
  	"get_emoticon" => {}, 
  	"get_meaning" => {}
  }

  loaded.each do |english, emoticon|
  	hash["get_meaning"][emoticon.last] = english
  	hash["get_emoticon"][emoticon.first] = emoticon.last
  end
  hash
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  loaded = load_library(path)
  result = loaded["get_emoticon"][emoticon]
  if result == nil
  	result = "Sorry, that emoticon was not found"
  end
  result
end

def get_english_meaning(path, emoticon)
  # code goes here
  loaded = load_library(path)
  result = loaded["get_meaning"][emoticon]

  if result == nil
  	result = "Sorry, that emoticon was not found"
  end
  result
end