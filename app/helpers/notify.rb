#!/usr/bin/ruby

case ARGV[0]
when "email"
  #email
  
when "growl"
  #growl broadcast
  
when "sms"
  #sms
  
when "say"
  #say
  
when "light"
  # do something with a light or lights
  
when "rgb"
  #do something with the rgb lights
  
else
  puts "usage: notify.rb [method] [address] [message] \n" 
  puts "example: notify.rb email user@domain.com 'something broke'\n"
end