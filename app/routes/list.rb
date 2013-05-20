#sample sinatra
require 'rubygems'
require 'sinatra'

get '/list' do
  insteon = YAML.load_file("config/insteon.yml")
  response = puts insteon['devname']
end
