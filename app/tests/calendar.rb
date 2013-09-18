require 'rubygems'
require 'google_calendar'
require 'parseconfig'

conf = ParseConfig.new('config/cloverleaf.conf')
username = conf['google_services_user']
password = conf['google_services_pass']

cal = Google::Calendar.new(:username => username,
                           :password => password,
                           :app_name => 'cloverleaf-googlecalendar-integration')

puts cal.events
#puts cal.find_events('Housework')