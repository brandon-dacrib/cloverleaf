get '/api/do/ir/:remote/:code' do
  system("modules/lirc-client.rb #{params[:remote]} #{params[:code]}")
  @output = 'OK'
  "#{@output}"
end