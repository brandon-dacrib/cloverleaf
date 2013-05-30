#sample sinatra
require 'rubygems'
require 'sinatra'

get ('/') { erb :index}
get ('/lights') { erb :lights}
get ('/sensors') {erb :sensors}
get ('/other') { erb :other}