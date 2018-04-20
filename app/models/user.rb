class User < ApplicationRecord
  validates :email, presence: true

  has_many :locations
  has_secure_password

  #add devis?
   

end
