#credit goes to this guy https://github.com/attack/barometer
require 'rubygems'
require 'barometer'

barometer = Barometer.new('New York')
weather = barometer.measure

puts weather.current.temperature