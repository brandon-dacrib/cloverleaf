#credit goes to this guy https://github.com/stewart/weather-api
require 'rubygems'
require 'weather-api'

# look up WOEID via http://weather.yahoo.com; enter location by city
# name or zip and WOEID is at end of resulting page url.

#make this a var based on zip code in a yaml file
response = Weather.lookup(12761374)

print <<EOT
#{response.title}
#{response.condition.temp} degrees
#{response.condition.text}
EOT
