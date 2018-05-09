class User < ApplicationRecord
  
  validates :email, presence: true, length:{ maximum: 105 }
  has_many :locations
  has_secure_password

  #add devis?
   

end
