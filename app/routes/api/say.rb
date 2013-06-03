# cross platform (os x/linux text to speech, uses the google translate api)
require 'rubygems'
require 'sinatra'
require 'uri'

#speech.sh script borrowed from:
#http://danfountain.com/2013/03/raspberry-pi-text-to-speech/

get '/say/:utterance' do
  utter = URI.decode("#{params[:utterance]}")
	system("helpers/say.rb /'#{utter}/'")
	@output = 'OK'
	"#{@output}"
end
