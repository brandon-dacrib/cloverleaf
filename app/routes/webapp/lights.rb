## lights ##
get '/lights' do
	@devices = Devices.order(:device_desc)
	erb :lights
end
## lights ##
