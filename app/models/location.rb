class Location < ApplicationRecord
  #attr_accessor :latitude, :longitude, :created_at
  belongs_to :user
  mount_base64_uploader :image, LocationImageUploader
  #csv export
  include GetLocation

  def newmap
    @a = Map.new
  end
    # include HTTParty
    # def self.loc(lat, long)
    #   #51.171880885597204,4.430588460447524
    #   @lat = lat
    #   @long = long
    #   @str = "https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyApzU3b0GAQzSzAUT9wtDNZtTZXi9WXi9Q&latlng=#{@lat},#{@long}&sensor=false"
    #   # self.class.get(@str)
    # end
        
    # def self.get_address   
    #   address = "#{loc['results'][0]['address_components'][1]['long_name']}, #{loc['results'][0]['address_components'][0]['long_name']}, #{loc['results'][0]['address_components'][2]['long_name']}"
    # end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |location|
        csv << location.attributes.values_at(*column_names)
      end 
    end
  end

#xlsx export


#pdf or html export

#  def self.suma(x,y)
#     @order = Order.find(x)
#     @product = Product.find(y)
#     return @order.quantity * @product.price
#  end

#   def self.loco(_latitude, _longitude)
#     Location.new
#     Location.latitude=_latitude
#     Location.longitude=_longitude
#     Location.save!
#  end

# include LocationHelper
#   def address(lat, long)
#     @x=lat
#     @y=long
#     r = LocationHelper::Map.new.location(@x,@y)
#     r.get_address
#   end

end
