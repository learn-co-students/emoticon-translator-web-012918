require "yaml"
require 'pry'

def load_library(path)
  hash = {}
  count = 0
  emoticons = YAML.load_file(path)
  emoticons.each do |name, faces|
    if count == 0
      hash["get_meaning"] = {faces.last => name}
      hash["get_emoticon"] = {faces.first => faces.last}
    else
      hash["get_meaning"][faces.last] = name
      hash["get_emoticon"][faces.first] = faces.last
    end
    count +=1
  end
  hash
end

def get_japanese_emoticon(path, emoticon)
  japanese = ""
  emoticons = load_library(path)
    if emoticons["get_emoticon"][emoticon]
      japanese = emoticons["get_emoticon"][emoticon]
    else
      return "Sorry, that emoticon was not found"
    end
  japanese
end

def get_english_meaning(path, emoticon)
  english = ""
  emoticons = load_library(path)
    if emoticons["get_meaning"][emoticon]
      english = emoticons["get_meaning"][emoticon]
    else
      return "Sorry, that emoticon was not found"
    end
  english
end
