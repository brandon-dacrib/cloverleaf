#!/usr/bin/ruby

#silly script to call the weather module and say the output
#needed because the tts module could only take so many characters 
arguments = ARGV[0]
output = `./wunderground.rb #{arguments}`.strip
puts output
speak = `./say.rb "#{output}"`
