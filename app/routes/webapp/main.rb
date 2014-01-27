#sample sinatra
require 'rubygems'
require 'sinatra'
require 'sequel'
require 'slim'

get ('/') { erb :index}
get ('/blinds') { erb :blinds}
get ('/lights') { erb :lights}
get ('/sensors') { erb :sensors}
get ('/test') { erb :test}