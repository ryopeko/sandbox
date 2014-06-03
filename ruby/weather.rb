require 'faraday'
require 'json'

p JSON.parse((Faraday.get 'http://weather.livedoor.com/forecast/webservice/json/v1?city=130010').body)['forecasts']
