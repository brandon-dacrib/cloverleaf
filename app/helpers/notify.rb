#!/usr/bin/ruby

case ARGV[0]
when "email"      #email something
  require 'pony'
  address = ARGV[1]
  message = ARGV[2]
  Pony.mail(:to => address, :from => 'brandon@dacrib.net', :subject => 'cloverleaf says:', :body => message)
  
when "growl"      #growl notifications
  hostname = ARGV[1]
  message  = ARGV[2]
  system("growl -y cloverleaf -n 'cloverleaf says:' -H #{hostname} -m '#{message}'")
  
when "say"      #basically say with addressing vs broadcast to all
  
when "sms"      #sms
  
when "twitter"  #tweet something
  
when "all"      #broadcast something really important
  
else
  puts "usage: notify.rb [method] [address] [message] \n" 
  puts "example: notify.rb email user@domain.com 'something broke'\n"
end
