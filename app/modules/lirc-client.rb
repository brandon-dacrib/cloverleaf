#!/usr/bin/ruby
system("irsend SEND_ONCE --count=5 #{ARGV[0]} #{ARGV[1]}")