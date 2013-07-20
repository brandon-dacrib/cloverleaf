#!/usr/bin/ruby
currenthour = Time.now.strftime("%-l%p")
cwd = Dir.pwd

system("wget -O /dev/null http://localhost:4567/say/the%20time%20%is%now%20#{currenthour}")
system("echo rm -f #{cwd}/aplay-D_card0-t_raw-f_S16_LE-r48000-c_2.raw")
