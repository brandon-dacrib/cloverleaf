get '/api/settings/delete/key_id/:key_id' do
	@keys = Keys
	Keys.where(:key_id => params[:key_id]).delete
	erb :settings_keys
end