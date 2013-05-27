currenthour = Time.now.strftime("%-l%p")
system("wget -O /dev/null http://localhost:4567/say/the%20time%20%is%now%20#{currenthour}")require "get-current-hour"
