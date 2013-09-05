require 'rubygems'
require 'httparty'
require 'json'
require 'pp'

class Forecast
  include HTTParty
  format :json
  
  def self.getcurrent
    get('http://api.openweathermap.org/data/2.5/weather?lat=40&lon=-73&units=imperial', :output => 'json')
  end
end

pp puts JSON.parse Forecast.getcurrent.body