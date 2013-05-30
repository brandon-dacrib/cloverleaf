#sample sinatra
require 'rubygems'
require 'sinatra'
require 'yaml'

get '/list' do
  insteon = YAML.load_file 'config/insteon.yml'
  insteon.each_key { |key|
    address = insteon[key]['address']
    devtype = insteon[key]['devtype']
    devname = insteon[key]['devname']
    response = puts "#{address} => #{devtype} => #{devname}"
  }
end
