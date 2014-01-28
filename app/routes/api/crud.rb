## settings ##
post '/api/settings/create/key/' do
	@keys = Keys
	keys.insert(:key => params[:key], :value => params[:value])
	erb :settings_keys
end

get '/api/settings/read/key/:key_id' do
	@keys = Keys
	Keys.where(:key_id => params[:key_id].select)
	erb :settings_keys
end

get '/api/settings/delete/key/:key_id' do
	@keys = Keys
	Keys.where(:key_id => params[:key_id]).delete
	if
		request.ip == "127.0.0.1"
		redirect '/settings/keys', 302
		erb :settings_keys
	else
	end
end

post '/api/settings/update/key/' do
	@keys = Keys
	table = params[:name]
	puts table
	Keys.where(:key_id => params[:pk]).update(table => params[:value])
	erb :settings_routers
end
## end settings ##

## routers ##
post '/api/settings/create/router/' do
	@routers = Routers
	routers.insert(:router_address => params[:router_address], :router_desc => params[:router_desc], :router_auth_user => params[:router_auth_user], :router_auth_pass => params[:router_auth_pass], :router_port => params[:router_port], :router_protocol => params[:router_protocol], :router_type => params[:router_type])
	erb :settings_routers
end

#get '/api/settings/read/router/:key_id' do
#	@keys = Keys
#	Keys.where(:key_id => params[:key_id].select)
#	erb :settings_keys
#end

get '/api/settings/delete/router/:router_id' do
	@routers = Routers
	Keys.where(:router_id => params[:router_id]).delete
	erb :settings_routers
end

post '/api/settings/update/router/' do
	@routers = Routers
	column = params[:name]
	puts table
	Routers.where(:router_id => params[:pk]).update(column => params[:value])
	erb :settings_routers
end