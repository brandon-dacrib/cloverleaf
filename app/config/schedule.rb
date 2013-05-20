# Use this file to easily define all of your cron jobs.

every '00 08-22 * * *' do
  cwd = Dir.pwd
  command "ruby #{cwd}/helpers/current-time.rb"
end