#!/usr/bin/ruby
require 'rubygems'

input = ARGV[0]
#	puts "#{input}"
  
play = "mpg123 data/sounds/#{input}"
system(play)
