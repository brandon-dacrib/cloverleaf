### ghetto handle the door being open or closed - proof of concept ###
get '/door-open' do
  response = HTTParty.get('http://localhost:4567/say/the%20front%20door%20is%20open')
  'OK'
end

get '/door-closed' do
    response = HTTParty.get('http://localhost:4567/say/the%20front%20door%20is%20closed')
    'OK'
end
#######################################