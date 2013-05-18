#sample script that gets a url and replies with the response
require 'rubygems'
require 'sinatra'
require	'httparty'

get '/hello' do
  'Hello World'
end

get '/light-on' do
  response = HTTParty.get('http://dacrib.net/lighton')
  puts response.body, response.code, response.message, response.headers.inspect
  @output = response.code, response.body
  "#{@output}"
end

### ghetto handle the door being open or closed - proof of concept ###
get '/door-open' do
  system("say the front door is open")
end

get '/door-closed' do
  system("say the front door is closed")
end
#######################################