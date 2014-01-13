#!/usr/bin/ruby
require 'rubygems'
require 'tts'
Tts.server_url  "http://tts-api.com/tts.mp3"

input = ARGV
#	puts "#{input}"
  
"#{input}".to_file "en", "/tmp/utterance.mp3"
system("mpg123 -q /tmp/utterance.mp3")
system("rm -f /tmp/utterance.mp3")
