#!/usr/bin/ruby
require 'rubygems'
require 'HTTParty'

class ISY
  include HTTParty
  base_uri '192.168.1.204'
  basic_auth 'admin', 'admin'
end  

  ISY.get('/rest/nodes/20%20BC%2093%201/cmd/DOF')