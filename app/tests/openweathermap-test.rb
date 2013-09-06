require 'rubygems'
require 'httparty'
 
 
class CurrentWeather
  include HTTParty
 
  def initialize
    @weatherdata = self.class.get('http://api.openweathermap.org/data/2.5/weather?lat=40&lon=-74&units=imperial', :output => :json)
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
    @weatherdata['weather'].first
  end
 
  def main
    @weatherdata['main']
  end
end
 
weatherdata = CurrentWeather.new
puts "current weather: #{weatherdata.description}, temparature is #{weatherdata.temp} degrees, humidity is at #{weatherdata.humidity} percent"
