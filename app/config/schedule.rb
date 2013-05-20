# Use this file to easily define all of your cron jobs.

every '00 08-22 * * *' do
  currenthour = Time.now.strftime("%-l%p")
  command "wget http://localhost:4567/say/the%20time%20%is%now%20#{currenthour}"
end
