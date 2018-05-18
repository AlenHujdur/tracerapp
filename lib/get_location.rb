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
      
      if @response = self.class.get("https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyApzU3b0GAQzSzAUT9wtDNZtTZXi9WXi9Q&latlng=#{@lat},#{@long}&sensor=false")
        @response
      else
        case response.code
          when 404
            p "Not found!"
          when 500...600
            p "Error: #{response.code}" 
        end
      end
    end    
    
    def get_country
      c = location
      if country = "#{c['results'][0]['address_components'][6].andand['long_name']}" == ''
        'no country name'
      else 
        country = "#{c['results'][0]['address_components'][6].andand['long_name']}"
      end
    end
    def get_region
      r = location
      region = "#{r['results'][2]['address_components'][2]['long_name']}"
    end
    def get_city
      c = location
      city = "#{c['results'][2]['address_components'][1]['long_name']}"
    end
    def get_address
      m = location    
      address = "#{m['results'][0]['address_components'][1]['long_name']}, #{m['results'][0]['address_components'][0]['long_name']}, #{m['results'][0]['address_components'][2]['long_name']}"
    end

    def get_details
      "https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyApzU3b0GAQzSzAUT9wtDNZtTZXi9WXi9Q&latlng=#{@lat},#{@long}&sensor=false"
    end

    def get_map_type
      "http://maps.googleapis.com/maps/api/staticmap?&size=600x600&sensor=false&zoom=16&markers=#{@lat}%2C#{@long}"
    end

    def get_satellite_type
      "http://maps.googleapis.com/maps/api/staticmap?maptype=satellite&size=600x600&sensor=false&zoom=16&markers=#{@lat}%2C#{@long}"
    end

    def get_image_location
      "https://maps.googleapis.com/maps/api/place/photo?key=AIzaSyApzU3b0GAQzSzAUT9wtDNZtTZXi9WXi9Q&maxwidth=400&latlng=#{@lat},#{@long}"
    end
  end

end
