#!/usr/bin/ruby
require 'rubygems'

input = ARGV
#	puts "#{input}"
  
run = "mplayer #{"/path/to/#{input}.mp3"} -ao sdl -vo x11 -framedrop -cache 16384 -cache-min 20/100"
system(run)