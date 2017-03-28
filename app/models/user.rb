class User < ApplicationRecord
  has_secure_password
  has_many :playdates, dependent: :destroy
  has_many :dogs, dependent: :destroy
  has_many :invites, dependent: :destroy
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "assets/images/doge-default.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
  validates :city, presence: true
  validates :password, presence: true
end
