#!/usr/bin/ruby
require 'rest-client'
require 'json'
require 'parseconfig'
require 'awesome_print'
  
conf = ParseConfig.new('config/cloverleaf.conf')
api_key = conf['wunderground_api_key']
zip = conf['wunderground_zip']

case ARGV[0]

when "current"      #get current weather
	url = "http://api.wunderground.com/api/#{api_key}/geolookup/conditions/q/#{zip}.json"
	res = RestClient.get url
	parsed_json = JSON.parse(res)
	
	location = parsed_json['location']['city']
	weather = parsed_json['current_observation']['weather']
	temp_f = parsed_json['current_observation']['temp_f']
	relative_humidity = parsed_json['current_observation']['relative_humidity']
	feelslike_f = parsed_json['current_observation']['feelslike_f']

	puts "\"current weather for #{location}: #{weather}, temperature is #{temp_f} degrees, relative humidity is #{relative_humidity}, and it feels like it is #{feelslike_f} degrees.\""

when "forecast" #get forecast with time arguments below
	url = "http://api.wunderground.com/api/#{api_key}/forecast/q/#{zip}.json"
	res = RestClient.get url
	parsed_json = JSON.parse(res)
	#ap parsed_json

	today_fctext = parsed_json['forecast']['txt_forecast']['forecastday'][0]['fcttext']
	tonight_fctext = parsed_json['forecast']['txt_forecast']['forecastday'][1]['fcttext']

	tomorrow_day_fctext = parsed_json['forecast']['txt_forecast']['forecastday'][2]['fcttext']
	tomorrow_night_fctext = parsed_json['forecast']['txt_forecast']['forecastday'][3]['fcttext']

	two_days_fctext = parsed_json['forecast']['txt_forecast']['forecastday'][4]['fcttext']
	two_night_fctext = parsed_json['forecast']['txt_forecast']['forecastday'][5]['fcttext']
	two_days_title = parsed_json['forecast']['txt_forecast']['forecastday'][4]['title']

	case ARGV[1]
	when "today"
		"\"todays forecast: #{today_fctext}\""

	when "tonight"
		"\"tonight: #{tonight_fctext}\""

	when "1"
		"\"tomorrows weather: #{tomorrow_day_fctext}, tomorrow night: #{tomorrow_night_fctext}\""

	when "2"
		"\"forecast for #{two_days_title}: #{two_days_fctext}\""
end
else
	puts "usage: wunderground.rb [method]\n" 
	puts "example: wunderground.rb current\n"
end
