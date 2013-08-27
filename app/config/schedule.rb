# Use this file to easily define all of your cron jobs.
cwd = Dir.pwd
currenthour = Time.now.strftime("%-l%p")

every '00 08-22 * * *' do
	command "#{cwd}/helpers/get-current-hour.rb &> /dev/null"
end

every :weekday, :at => '7:30pm' do
	command "#{cwd}/helpers/say.rb 'Gabriel get in the shower' "
end

every :weekday, :at => '8:30pm' do
	command "#{cwd}/helpers/say.rb 'Gabriel it is time to read' "
end

every :weekday, :at => '8:55pm' do
  command "#{cwd}/helpers/say.rb 'Gabriel make sure you have brushed your teeth, and taken your medicine' "
end

every :weekday, :at => '8:59pm' do
  command "#{cwd}/helpers/say.rb 'Gabriel it is time to go to bed' "
end

every '0 10-12/2 * * *' do
  require 'parseconfig'
  conf = ParseConfig.new("#{cwd}/config/cloverleaf.conf")
  dawn_mobile = conf['dawn_mobile']
  command "cd #{cwd}; #{cwd}/helpers/notify.rb sms #{dawn_mobile} 'Reminder: drink some water'"
end
