#get '/settings' do
#	@devices = Devices
#	@keys = Keys
#	@routers = Routers
#	erb :settings
#end

get '/settings' do
	@keys = Keys
	erb :settings_keys
end

post '/settings' do
	@keys = Keys
	Keys.insert(:key => params[:key], :value => params[:value])
	erb	:settings_keys
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

delete '/settings/keys/' do
	@keys = Keys
	Keys.delete(:key_id => params[:key_id])
	erb :settings_keys
end