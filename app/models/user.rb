class User < ApplicationRecord
  has_many :locations
  has_secure_password

  #add devis?
   

end
