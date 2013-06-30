require 'socket'

# define some commands, these have been converted into ascii from the master list
#here http://www.limitlessled.com/dev/
# LimitlessLED RGB
# 22 00 55 – Lamps On = "?U
# 21 00 55 – Lamps Off = !?U
# 23 00 55 – Brightness Up = #?U
# 24 00 55 – Brightness Down (There are nine steps between min and max) = $?U
# 27 00 55 – Mode Up = '?U
# 28 00 55 – Mode Down (There are 20 modes. The lowest is constant white) = (?U
# 25 00 55 – Speed Up (Fast) = %?U
# 26 00 55 – Speed Down (Slow) = &?U
# 20 xx 55 – Set Colour to xx = varies

socket = UDPSocket.new
socket.send("\x21\x00\x55", 0, '192.168.1.205', 50000)