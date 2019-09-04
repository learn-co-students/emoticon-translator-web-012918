# require modules here
require "yaml"
require "pry"

def load_library(load_yaml)
  # code goes here
  file = YAML.load_file(load_yaml)
  e_hash = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  file.each do |emoticon, arr|
    e_hash["get_meaning"][arr[1]] = emoticon
    e_hash["get_emoticon"][arr[0]] = arr[1]
end
e_hash
end

def get_japanese_emoticon(load_yaml, eng_emote)
  file = load_library(load_yaml)
  if file["get_emoticon"].include?(eng_emote)
    return file["get_emoticon"][eng_emote]
  else
    return "Sorry, that emoticon was not found"
end
end

def get_english_meaning(load_yaml, jap_emote)
  file = load_library(load_yaml)
  if file["get_meaning"].include?(jap_emote)
    return file["get_meaning"][jap_emote]
  else
    return "Sorry, that emoticon was not found"
end
end
