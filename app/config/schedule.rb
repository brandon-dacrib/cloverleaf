# Use this file to easily define all of your cron jobs.

every '* * * * *' do
  command "wget http://localhost:4567/say/the%20time%20%is%now"
end