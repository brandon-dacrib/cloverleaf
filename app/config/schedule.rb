# Use this file to easily define all of your cron jobs.
cwd = Dir.pwd
every '00 08-22 * * *' do
	command "ruby #{cwd}/helpers/get-current-hour.rb"
end

every :weekday, :at => '7:30pm' do
	command "ruby #{cwd}/helpers/say.rb 'Gabriel get in the shower' "
end

every :weekday, :at => '8:30pm' do
	command "ruby #{cwd}/helpers/say.rb 'Gabriel it is time to read' "
end

every :weekday, :at => '8:55' do
  command "ruby #{cwd}/helpers/say.rb 'Gabriel make sure you have brushed your teeth, and taken your medicine' "
