class Location < ApplicationRecord
  #attr_accessor :latitude, :longitude, :created_at
  belongs_to :user
  mount_base64_uploader :image, LocationImageUploader
#csv export
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |order|
        csv << order.attributes.values_at(*column_names)
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

end
