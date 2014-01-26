get '/api/settings/create/key/:key_id' do
	@keys = Keys
	Keys.where(:key_id => params[:key_id].insert)
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
	erb :settings_keys
end

post '/api/settings/update/key/' do
	@keys = Keys
	table = params[:name]
	puts table
	Keys.where(:key_id => params[:pk]).update(table => params[:value])
	erb :settings_keys
end

#
#name - value
#value - 100422
#pk - 1