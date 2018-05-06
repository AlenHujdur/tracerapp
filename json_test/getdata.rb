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

m.location.each do |l|
  put "Lokacija: #{l['address_components']}"
end
