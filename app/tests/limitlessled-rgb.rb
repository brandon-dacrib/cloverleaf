require 'socket'

# master list of commands here: http://www.limitlessled.com/dev/
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
#passed_color = ARGV[1]
#puts passed_color
#colorcode = "\x20" + '\x' + ARGV[1] + "\x55"
#puts colorcode
#set_color = "colorcode" #going to need to sort out how to convert integers passed to hex 

###############################################
case ARGV[0]
when "on"
  socket = UDPSocket.new
  socket.send(lamp_on, 0, wifi_bridge_ip, wifi_bridge_port)
  
when "off"
  socket = UDPSocket.new
  socket.send(lamp_off, 0, wifi_bridge_ip, wifi_bridge_port)
  
when "bright"
  socket = UDPSocket.new
  socket.send(bright_up, 0, wifi_bridge_ip, wifi_bridge_port)
  
when "dim"
  socket = UDPSocket.new
  socket.send(bright_down, 0, wifi_bridge_ip, wifi_bridge_port)
  
when "modeup"
  socket = UDPSocket.new
  socket.send(mode_up, 0, wifi_bridge_ip, wifi_bridge_port)
  
when "modedown"
  socket = UDPSocket.new
  socket.send(mode_down, 0, wifi_bridge_ip, wifi_bridge_port)
  
when "faster"
  socket = UDPSocket.new
  socket.send(speed_up, 0, wifi_bridge_ip, wifi_bridge_port)
  
when "slower"
  socket = UDPSocket.new
  socket.send(speed_down, 0, wifi_bridge_ip, wifi_bridge_port)
  
when "color"
  #set color argument to be an integer
  passed_color = ARGV[1].to_i
  puts "passed_color is #{passed_color}"

  #convert that to a hex value, doesn't work with values over 99 :( 
  colorcode = passed_color.to_s(16)
  puts "colorcode is #{colorcode}"
  puts "I am sending '\x20#{colorcode}\x55'"
  
  #send the value
  set_color = "\x20#{colorcode}\x55" #going to need to sort out how to convert integers passed to hex + how the heck are these tabulated?
  socket = UDPSocket.new
  socket.send(set_color, 0, wifi_bridge_ip, wifi_bridge_port)
  
else puts "usage: ruby limitlessled-rgb.rb [on | off | bright| dim | faster | slower | color (hex value)]"
end
