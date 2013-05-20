#sample sinatra
require 'rubygems'
require 'sinatra'

get '/list' do
  insteon = YAML.load(File.open('config/insteon.yml'))
  response = puts insteon[0]['address'],insteon[0]['devtype'],insteon[0]['devname']
end
