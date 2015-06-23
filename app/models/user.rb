class User < ActiveRecord::Base
  has_many :cheeses
  has_secure_password
end
