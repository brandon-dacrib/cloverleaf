#!/usr/local/bin/ruby
require 'rest-client'
require 'json'
 
 case ARGV[0]
when "current"      #get current weather
  require 'parseconfig'
  conf = ParseConfig.new('config/cloverleaf.conf')
  api_key = conf['wunderground_api_key']
  zip = conf['wunderground_zip']

  url = "http://api.wunderground.com/api/#{api_key}/geolookup/conditions/q/#{zip}.json"

  res = RestClient.get url
  parsed_json = JSON.parse(res)
  location = parsed_json['location']['city']
  weather = parsed_json['current_observation']['weather']
  temp_f = parsed_json['current_observation']['temp_f']
  relative_humidity = parsed_json['current_observation']['relative_humidity']
  feelslike_f = parsed_json['current_observation']['feelslike_f']

  print "current weather: #{weather}, temperature is #{temp_f} degrees, relative_humidity is #{relative_humidity}, and it feels like it is #{feelslike_f} degrees.\n"

else
	puts "usage: wunderground.rb [method]\n" 
	puts "example: wunderground.rb current\n"
end