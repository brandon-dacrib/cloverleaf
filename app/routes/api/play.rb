# cross platform (os x/linux text to speech, uses the google translate api)
require 'rubygems'
require 'sinatra'
require 'uri'

get '/play/:sound' do
<<<<<<< HEAD
  utter = URI.decode("#{params[:sound]}")
=======
  sound = URI.decode("#{params[:sound]}")
>>>>>>> 4fcf8aa30ba72f7752270d06ee674c4b8c69dd98
	system("helpers/play.rb #{sound}")
	@output = 'OK'
	"#{@output}"
end
