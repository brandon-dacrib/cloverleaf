## settings ##
get '/settings' do
	redirect '/settings/keys', 302
	erb :settings_keys
end


get '/settings/devices' do
	@devices = Devices
	erb :settings_devices
end

get '/settings/keys' do
	@keys = Keys
	erb :settings_keys
end

get '/settings/routers' do
	@routers = Routers
	erb	:settings_routers
end

post '/settings/keys' do
	@keys = Keys
	Keys.insert(:key => params[:key], :value => params[:value])
	erb	:settings_keys
end
## settings ##