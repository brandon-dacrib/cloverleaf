require 'rest-client'
require 'json'
 
url = "http://api.wunderground.com/api/#{api_key}/geolookup/conditions/q/10044.json"
 
res = RestClient.get url
parsed_json = JSON.parse(res)
location = parsed_json['location']['city']
weather = parsed_json['current_observation']['weather']
temp_f = parsed_json['current_observation']['temp_f']
relative_humidity = parsed_json['current_observation']['relative_humidity']
feelslike_f = parsed_json['current_observation']['feelslike_f']

print "current weather: #{weather}, temperature is #{temp_f} degrees, relative_humidity is #{relative_humidity}, and it feels like it is #{feelslike_f} degrees\n"