#sample sinatra
require 'rubygems'
require 'sinatra'
require 'sequel'
require 'slim'

get ('/') { erb :index}
get ('/ir') { erb :ir}
get ('/lights') { erb :lights}
get ('/sensors') { erb :sensors}
get ('/test') { erb :test}