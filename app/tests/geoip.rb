#!/usr/local/bin/ruby
require 'rest-client'
require 'json'
require 'awesome_print' 

url = "freegeoip.net/json/"

res = RestClient.get url
parsed_json = JSON.parse(res)
ap parsed_json

city = parsed_json['city']
zipcode = parsed_json['zipcode']
latitude = parsed_json["latitude"]
longitude = parsed_json["longitude"]

puts " city => #{city}\n zipcode => #{zipcode}\n lat => #{latitude}\n lon => #{longitude}\n"