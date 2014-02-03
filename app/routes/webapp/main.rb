#sample sinatra
require 'rubygems'
require 'sinatra'
require 'sequel'
require 'slim'

get ('/') { erb :index}
get ('/ir') { erb :ir}
get ('/sensors') { erb :sensors}
get ('/test') { erb :test}