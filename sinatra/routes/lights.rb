get '/light-on' do
  response = HTTParty.get('http://dacrib.net/cloverleaf/test/lighton')
  puts response.body, response.code, response.message, response.headers.inspect
  @output = response.code, response.body
  "#{@output}"
end