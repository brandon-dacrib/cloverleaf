# simple example of playing a file
require 'rubygems'
require 'sinatra'
require 'uri'

get '/play/:file' do
  utter = URI.decode("#{params[:file]}")
	system("helpers/play.rb #{file}")
	@output = 'OK'
	"#{@output}"
end
