#second weather forecast script, this time using forecast.io
require 'rubygems'
require 'forecast_io'


Forecast::IO.api_key = '29dbab0ff5ffe0bcd4c50d0d4897460e'

latitude = 40
longitude = -73

forecast = Forecast::IO.forecast(latitude, longitude)
forecast.latitude
forecast.longitude