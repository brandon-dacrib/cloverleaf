require 'open-uri'
require 'uri'

module Tts
  BASE_URL   = "http://translate.google.com/translate_tts"
  USER_AGENT = "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.68 Safari/534.24"  
  LANG       = "en"

  def to_mp3 file_name=nil
    parts = validate_text_length(self)
    file_name = generate_file_name(self[0..20]) if file_name.nil?
    parts.each do |part|
      url = part.to_url()
      fetch_mp3(url, file_name) 
    end
    "'#{file_name}' saved to disk"
  end
 
  # Checks if the text needs to be split into chunks (batch-mode) 
  def validate_text_length text
    if text.length > 100
      chunk_text(text)
    else 
      [text]
    end
  end

  # Splits text into chunks of 100 chars, making sure not split the last word
  def chunk_text text
    chunks = []
    words = split_into_words(text)
    chunk = ''
    words.each do |word|
      if (chunk.length + word.length) > 100
        chunks << chunk.strip!
        chunk = ''
      end
      chunk += "#{word} "
    end
    chunks << chunk.strip!
  end

  # Splits text into array of words (inc punctuation), and trims any excessive whitespace
  def split_into_words text
    text.gsub(/\s+/m, ' ').strip.split(" ")
  end

  # Generates output file name
  def generate_file_name text
    to_valid_fn(text + ".mp3")
  end

  # Replaces invalid file name characters with underscores
  def to_valid_fn fn
    fn.gsub(/[\x00\/\\:\*\?\"<>\|]/, '_')
  end

  # Generates the Google Translate API url
  def to_url 
    base = "#{BASE_URL}?tl=#{LANG}&q=#{URI.escape self}"
  end

  # Fetches the MP3 from Google and appends it to the output MP3
  def fetch_mp3 url, file_name
    begin 
      content = open(url, "User-Agent" => USER_AGENT).read
 
      File.open(file_name, "ab") do |f|
        f.puts content
      end
    rescue => e
      $stderr.puts("Internet error! #{e.message}")
      exit(1)
    end
  end

end

class String
  include Tts
end

