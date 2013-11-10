# cross platform (os x/linux text to speech, uses the google translate api)
require 'rubygems'
require 'sinatra'
require 'uri'

get '/play/:sound' do
  utter = URI.decode("#{params[:sound]}")
	system("helpers/play.rb #{sound}")
	@output = 'OK'
	"#{@output}"
end
