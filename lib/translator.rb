require "yaml"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  new_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons.each do |meaning, emoticons|
    new_hash["get_meaning"][emoticons[1]] = meaning
    new_hash["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  new_hash = load_library(file_path)
  if new_hash["get_emoticon"].has_key?(emoticon)
    new_hash["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  new_hash = load_library(file_path)
  if new_hash["get_meaning"].has_key?(emoticon)
    new_hash["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end
