require 'rubygems'
require 'httparty'
require 'json'


class Forecast
  include HTTParty

  def self.getcurrent
    get('http://api.openweathermap.org/data/2.5/weather?lat=40&lon=-74&units=imperial')
  end
end

parsed = JSON.parse Forecast.getcurrent.body
#puts parsed
puts parsed["weather"],parsed["main"]