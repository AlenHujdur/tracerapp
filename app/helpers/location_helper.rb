
module LocationHelper

  class Map
    include HTTParty

    def location(lat, long)
      #51.171880885597204,4.430588460447524
      @lat = lat
      @long = long
      @str = "https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyApzU3b0GAQzSzAUT9wtDNZtTZXi9WXi9Q&latlng=#{@lat},#{@long}&sensor=false"
      self.class.get(@str)
    end
        
    def get_address   
      address = "#{Map.location.new(@lat,@long)['results'][0]['address_components'][1]['long_name']}, #{Map.location.new(@lat,@long)['results'][0]['address_components'][0]['long_name']}, #{Map.location.new(@lat,@long)['results'][0]['address_components'][2]['long_name']}"
    end

  end
  #city = m.location['results'][2]['address_components'][1]['long_name']
  #region = m.location['results'][2]['address_components'][2]['long_name']
  #country = m.location['results'][0]['address_components'][6]['long_name']

end
