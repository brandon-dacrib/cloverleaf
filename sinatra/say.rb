#sample code that uses sinatra to provide a service that 
#says whatever is passed to it out loud,
#currently only using the os x "say" command but I will build some linux support
require 'rubygems'
require 'sinatra'

#pseudo code that defines the say command based on OS, or just uses
#the google speach API example
#aplay http://translate.google.com/translate_tts?tl=en&q=Hello%20World
#sample script http://danfountain.com/2013/03/raspberry-pi-text-to-speech/

get '/say/:utterance' do
  system("say #{params[:utterance]}")
end

