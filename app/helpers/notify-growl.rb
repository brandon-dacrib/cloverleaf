require 'rubygems'
require 'ruby_gntp'

# -- Standard way
growl = GNTP.new("Cloverleaf Notification")
growl.register({:notifications => [{
  :name     => "cloverleaf",
  :enabled  => true,
}]})

growl.notify({
  :name  => "cloverleaf",
  :title => "Cloverleaf Title",
  :text  => "X was turned on",
  :icon  => "http://www.hatena.ne.jp/users/sn/snaka72/profile.gif",
  :sticky=> true,
})

# -- Instant notification
#GNTP.notify({
#  :app_name => "Instant notify",
#  :title    => "Instant notification", 
#  :text     => "Instant notification available now.",
#  :icon     => "http://www.hatena.ne.jp/users/sn/snaka72/profile.gif",
#})

