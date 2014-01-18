require 'yaml'
 
insteon = YAML.load_file 'config/insteon.yml'
insteon.each_key { |key|
  address = insteon[key]['address']
  devtype = insteon[key]['devtype']
  devname = insteon[key]['devname']
 
  puts "#{address} => #{devtype} => #{devname}"
  # login ...
}
