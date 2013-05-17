#sample script that gets a url and replies with the response
require 'rubygems'
require 'sinatra'
require	'httparty'

get '/hello' do
  'Hello World'
end

get '/lighton' do
  response = HTTParty.get('http://dacrib.net/lighton')
  puts response.body, response.code, response.message, response.headers.inspect
  @output = response.code, response.body
  "#{@output}"
end
