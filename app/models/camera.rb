class Camera < ApplicationRecord
  #Validation needs to be added
  belongs_to :location
  mount_base64_uploader :image, LocationImageUploader
end
