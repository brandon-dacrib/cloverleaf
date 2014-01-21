#sample sinatra
require 'rubygems'
require 'sinatra'
require 'data_mapper'
require 'slim'

get ('/') { erb :index}
get ('/blinds') { erb :blinds}
get ('/lights') { erb :lights}
get ('/sensors') {erb :sensors}
#get ('/settings') { erb :settings}
get ('/test') { slim :test}