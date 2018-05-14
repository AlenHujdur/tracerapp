module GetLocation
  require 'rubygems'
  require 'httparty'

  class Map
    include HTTParty
    def initialize(lat, long)
      @lat = lat
      @long = long
    end 
    def location
      @m = Map.new(@lat,@long)
      self.class.get("https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyApzU3b0GAQzSzAUT9wtDNZtTZXi9WXi9Q&latlng=#{@lat},#{@long}&sensor=false")
    end
        
    # @city = @m.location['results'][2]['address_components'][1]['long_name']
    def get_address
      # @m = Map.new
      @address = "#{@m.location['results'][0]['address_components'][1]['long_name']}, #{@m.location['results'][0]['address_components'][0]['long_name']}, #{@m.location['results'][0]['address_components'][2]['long_name']}"
    end
  end

    
    # p "Adress: #{m.location['results'][0]['address_components'][1]['long_name']}, #{m.location['results'][0]['address_components'][0]['long_name']}, #{m.location['results'][0]['address_components'][2]['long_name']}"
    # p "City: #{m.location['results'][2]['address_components'][1]['long_name']}"
    # p "Region: #{m.location['results'][2]['address_components'][2]['long_name']}"
    # p "Country: #{m.location['results'][0]['address_components'][6]['long_name']}"


    # p "City: #{m.location['results'][2]['address_components'][1]['long_name']}"
    # region = m.location['results'][2]['address_components'][2]['long_name']
    # country = m.location['results'][0]['address_components'][6]['long_name']

    # p city.to_s
end