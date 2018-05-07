require 'rubygems'
require 'httparty'

#response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyApzU3b0GAQzSzAUT9wtDNZtTZXi9WXi9Q&latlng=51.171880885597204,4.430588460447524&sensor=false')

#puts response.headers.inspect

class Map
  include HTTParty
  #base_uri = "maps.googleapis.com/"


  def location
    self.class.get('https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyApzU3b0GAQzSzAUT9wtDNZtTZXi9WXi9Q&latlng=51.171880885597204,4.430588460447524&sensor=false')
  end
end

  m = Map.new
  p "Adress: #{m.location['results'][0]['address_components'][1]['long_name']}, #{m.location['results'][0]['address_components'][0]['long_name']}, #{m.location['results'][0]['address_components'][2]['long_name']}"
  p "City: #{m.location['results'][2]['address_components'][1]['long_name']}"
  p "Region: #{m.location['results'][2]['address_components'][2]['long_name']}"
  p "Country: #{m.location['results'][0]['address_components'][6]['long_name']}"
