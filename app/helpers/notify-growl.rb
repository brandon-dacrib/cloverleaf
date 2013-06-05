require 'rubygems'
require 'ruby-growl'
 
g = Growl.new("192.168.1.101", "ruby-growl", ["ruby-growl Notification"], ["ruby-growl Notification"], nil)
g.notify("ruby-growl Notification", "It Came From Ruby-Growl", "Greetings!", 1, true)