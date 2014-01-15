#!/usr/bin/ruby
require 'rubygems'
require 'tts'
Tts.server_url  "http://app0:8080/api/say/"

input = ARGV
#puts "#{input}"
  
"#{input}".to_file "en", "/tmp/utterance.mp3"
system("mpg123 -q /tmp/utterance.mp3")
system("rm -f /tmp/utterance.mp3")
