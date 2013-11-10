# cross platform (os x/linux text to speech, uses the google translate api)
require 'rubygems'
require 'sinatra'
require 'uri'

get '/say/:utterance' do
  utter = URI.decode("#{params[:utterance]}")
	system("helpers/say.rb /'#{utter}/'")
	@output = 'OK'
	"#{@output}"
end
