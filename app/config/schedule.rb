# Use this file to easily define all of your cron jobs.
cwd = Dir.pwd
currenthour = Time.now.strftime("%-l%p")

every '00 08-22 * * 1-5' do
	command "#{cwd}/modules/get-current-hour.rb &> /dev/null"
end

every '00 10-22 * * 0,6' do
	command "#{cwd}/modules/get-current-hour.rb &> /dev/null"
end

every :weekday, :at => '7:30pm' do
	command "#{cwd}/modules/say.rb 'Gabriel get in the shower' "
end

every :weekday, :at => '7:55pm' do
  command "#{cwd}/modules/say.rb 'Gabriel make sure you have taken your medicine, and brushed your teeth' "
end

every :weekday, :at => '7:59pm' do
	command "#{cwd}/modules/say.rb 'Gabriel it is time to read' "
end

every :weekday, :at => '8:30pm' do
  command "#{cwd}/modules/say.rb 'Gabriel it is time to go to bed' "
end

every :weekday, :at => '8:00am' do
	command "#{cwd}/modules/say.rb 'Gabriel take your q var' "
end

#needs to pull data from db 
#every '0 12 * * 1-5' do
#  require 'parseconfig'
#  conf = ParseConfig.new("#{cwd}/config/cloverleaf.conf")
#  dawn_mobile = conf['dawn_mobile']
#  command "cd #{cwd}; #{cwd}/modules/notify.rb sms #{dawn_mobile} 'Reminder: drink some water'"
#end

every '59 09,11 * * *' do
  command "#{cwd}/modules/wunderground.rb current | xargs #{cwd}/modules/say.rb"
end

every :weekday, :at => '7:59am' do
  command "#{cwd}/modules/wunderground.rb forecast today | xargs #{cwd}/modules/say.rb"
end

every :day, :at => '7:30pm' do
  command "#{cwd}/modules/wunderground.rb forecast 1 | xargs #{cwd}/modules/say.rb"
end