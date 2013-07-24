#!/usr/bin/ruby

case ARGV[0]
when "email"
  #email
  
when "growl"
  #growl broadcast
  
when "sms"
  #sms
  
when "say"
  #basically say with addressing vs broadcast to all
  
else
  puts "usage: notify.rb [method] [address] [message] \n" 
  puts "example: notify.rb email user@domain.com 'something broke'\n"
end