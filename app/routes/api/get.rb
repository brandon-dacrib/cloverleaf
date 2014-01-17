require 'rubygems'
require 'sinatra'

get '/get/weather' do
  content_type :txt
  system("ruby modules/get-current-weather.rb")
  'OK'
end
