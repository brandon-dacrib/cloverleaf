require 'rubygems'
require 'sinatra'
require	'httparty'

get '/say/:utterance' do
  system("say #{params[:utterance]}")
end

