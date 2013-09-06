require 'rubygems'
require 'httparty'
require 'json'
 
 
class Forecast
  include HTTParty
 
  def initialize
    @forecast = self.class.get('http://api.openweathermap.org/data/2.5/weather?lat=40&lon=-74&units=imperial', :output => :json)
  end
 
  def description
    weather['description']
  end
 
  def humidity
    main['humidity']
  end
  
  def temp
    main['temp']
  end
  
  private
 
  def weather
    @forecast['weather'].first
  end
 
  def main
    @forecast['main']
  end
end
 
forecast = Forecast.new
puts "current weather: #{forecast.description}, temparature is #{forecast.temp} degrees, humidity is at #{forecast.humidity} percent"
