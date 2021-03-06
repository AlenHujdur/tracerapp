class Location < ApplicationRecord

  belongs_to :user
  has_many :cameras
  mount_base64_uploader :image, LocationImageUploader
  #csv export
  include GetLocation

  def newmap(lat,long)
    @a = Map.new(lat,long)
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |location|
        csv << location.attributes.values_at(*column_names)
      end 
    end
  end
@api = GOOGLE_MAPS_API
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
