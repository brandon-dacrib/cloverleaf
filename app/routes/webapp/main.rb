#sample sinatra
require 'rubygems'
require 'sinatra'

get ('/') { erb :index}
get ('/blinds') { erb :blinds}
get ('/lights') { erb :lights}
get ('/sensors') {erb :sensors}
get ('/settings') { erb :settings}