#!/usr/bin/ruby

case ARGV[0]
when "email"      #email something
  require 'parseconfig'
  require 'pony'
  conf = ParseConfig.new('config/cloverleaf.conf')
  from_email = conf['from_email']
  
  address = ARGV[1]
  message = ARGV[2]
  Pony.mail(:to => address, :from => from_email, :subject => 'cloverleaf says:', :body => message)
  
when "growl"      #growl notifications
  hostname = ARGV[1]
  message  = ARGV[2]
  system("growl -y cloverleaf -n 'cloverleaf says:' -H #{hostname} -m '#{message}'")
  
when "say"      #basically say with addressing vs broadcast to all
  
when "sms"      #sms
  require 'parseconfig'
  require 'googlevoiceapi'
  
  to_number = ARGV[1]
  message   = ARGV[0]
  
  conf = ParseConfig.new('config/cloverleaf.conf')
  google_voice_user = conf['google_voice_user']
  google_voice_pass = conf['google_voice_pass']
  
  api = GoogleVoice::Api.new(google_voice_user, google_voice_pass)
  api.sms(to_number, message)
  
when "twitter"  #tweet something
  
when "all"      #broadcast something really important
  
else
  puts "usage: notify.rb [method] [address] [message] \n" 
  puts "example: notify.rb email user@domain.com 'something broke'\n"
end