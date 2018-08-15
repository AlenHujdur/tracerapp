class User < ApplicationRecord
  
  validates :email, presence: true, length:{ maximum: 105 }
  has_many :locations
  #has_many :cameras, :through => :locations
  has_secure_password
   

end
