#!/usr/bin/ruby

case ARGV[0]
when "email"
  #email
  
when "growl" #growl notifications
  hostname = ARGV[1]
  message  = ARGV[2]
  system("growl -n "cloverleaf says" -H #{hostname} -m #{message}")
  
when "say"
  #basically say with addressing vs broadcast to all
  
when "sms"
  #sms
  
when "all"
  #broadcast something really important
  
else
  puts "usage: notify.rb [method] [address] [message] \n" 
  puts "example: notify.rb email user@domain.com 'something broke'\n"
end