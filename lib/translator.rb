# require modules here
require "yaml"
require "pry"

def load_library(yml)
  file = YAML.load_file(yml)
  hash = {"get_meaning" => {}, "get_emoticon" => {}}

  file.each do |meaning, emoticon_array|
    hash["get_meaning"][emoticon_array[1]] = meaning
    hash["get_emoticon"][emoticon_array[0]] = emoticon_array[1]
  end
  hash
end

def get_japanese_emoticon(yml, emoticon)
  hash = load_library(yml)

  if hash["get_emoticon"].include?(emoticon)
    hash["get_emoticon"][emoticon]
  else hash["get_emoticon"][emoticon].nil?
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(yml, emoticon)
  hash = load_library(yml)

  if hash["get_meaning"].include?(emoticon)
    hash["get_meaning"][emoticon]
  else hash["get_meaning"][emoticon].nil?
    "Sorry, that emoticon was not found"
  end
end
