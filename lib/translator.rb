require 'pry'
require 'yaml'

def load_library(file)
  emoticons = YAML.load_file(file)
  new_hash = {"get_meaning"=>{}, "get_emoticon"=>{}}

  emoticons.each do |k, v|
    new_hash["get_meaning"][v[1]] = k
    new_hash["get_emoticon"][v[0]] = v[1]
  end
  new_hash
end

def get_japanese_emoticon(file, emoticon)
  emoticons = load_library(file)
  japanese_emoticons = emoticons["get_emoticon"]
  japanese_emoticon = nil

  if japanese_emoticons.include?(emoticon)
    japanese_emoticons.each do |k, v|
        if k = emoticon
          japanese_emoticon = japanese_emoticons[k]
        end
    end
  else
    return "Sorry, that emoticon was not found"
  end

  japanese_emoticon
end

def get_english_meaning(file, emoticon)
  emoticons = load_library(file)
  english_meanings = emoticons["get_meaning"]
  english_meaning = nil

  if english_meanings.include?(emoticon)
    english_meanings.each do |k, v|
      if k = emoticon
        english_meaning = english_meanings[k]
      end
    end
  else
    return "Sorry, that emoticon was not found"
  end

  english_meaning
end
