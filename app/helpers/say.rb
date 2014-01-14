#!/usr/bin/ruby
require 'rubygems'
require_relative '../lib/google_tts'
#require 'tts'
#Tts.server_url  "http://tts-api.com/tts.mp3"

input = ARGV
#	puts "#{input}"
  
"#{input}".to_mp3 "/tmp/utterance.mp3"
system("mpg123 -q /tmp/utterance.mp3")
system("rm -f /tmp/utterance.mp3")
