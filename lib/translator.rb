require "yaml"

def load_library(yml)
  emoticons = YAML.load_file('./lib/emoticons.yml')

  return_hash = {"get_meaning" => {}, "get_emoticon" => {}}

  emoticons.each do |feeling, emojis|
    english_emoticon = emojis[0]
    japanese_emoticon = emojis[1]

    return_hash["get_meaning"][japanese_emoticon] = feeling
    return_hash["get_emoticon"][english_emoticon] = japanese_emoticon
  end

  return return_hash

end

def get_japanese_emoticon(yml, emoticon)
  #input english -> return Japanese
  #"8D"=>"(^0_0^)"
  #emoticons = YAML.load_file('./lib/emoticons.yml')
  return_hash = load_library(yml)

  if return_hash["get_emoticon"].include?(emoticon)
    return return_hash["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end

end

def get_english_meaning(yml, emoticon)
  return_hash = load_library(yml)

  if return_hash["get_meaning"].include?(emoticon)
    return return_hash["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end

end
