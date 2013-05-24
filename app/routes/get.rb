require 'rubygems'
require 'sinatra'

get '/get/weather' do
  system("ruby helpers/get-current-weather.rb")
end
