class User < ApplicationRecord
  has_secure_password
  has_many :playdates
  has_many :dogs
  has_many :invites
end
