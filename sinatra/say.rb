require 'rubygems'
require 'sinatra'

get '/say/:utterance' do
  system("say #{params[:utterance]}")
end

