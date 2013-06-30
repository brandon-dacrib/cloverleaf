require 'socket'
require 'optparse'

# define some commands from the master list here http://www.limitlessled.com/dev/
# LimitlessLED RGB
# 22 00 55 – Lamps On
# 21 00 55 – Lamps Off
# 23 00 55 – Brightness Up
# 24 00 55 – Brightness Down (There are nine steps between min and max)
# 27 00 55 – Mode Up
# 28 00 55 – Mode Down (There are 20 modes. The lowest is constant white)
# 25 00 55 – Speed Up (Fast)
# 26 00 55 – Speed Down (Slow)
# 20 xx 55 – Set Colour to xx

#define limitlessled wifi bridge
wifi_bridge_ip = '192.168.1.205'
wifi_bridge_port = 50000

#define lamp states
lamp_on = "\x22\x00\x55"
lamp_off = "\x21\x00\x55"

#define brightness states
bright_up = "\x23\x00\x55"
bright_down = "\x24\x00\x55"

#define mode states
mode_up = "\x27\x00\x55"
mode_down = "\x28\x00\x55"

#define speed states
speed_up = "\x25\x00\x55"
speed_down = "\x26\x00\x55"

#set color
set_color = "\x20\xa0\x55" #going to need to sort out how to convert integers passed to hex 

socket = UDPSocket.new
socket.send(mode_down, 0, wifi_bridge_ip, wifi_bridge_port)