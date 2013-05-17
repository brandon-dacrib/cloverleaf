#sample code that uses sinatra to provide a service that 
#says whatever is passed to it out loud,
#currently only using the os x "say" command but I will build some linux support
require 'rubygems'
require 'sinatra'

get '/say/:utterance' do
  system("say #{params[:utterance]}")
end

