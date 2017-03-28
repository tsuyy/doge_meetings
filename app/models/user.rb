class User < ApplicationRecord
  has_secure_password
  has_many :playdates, dependent: :destroy
  has_many :dogs, dependent: :destroy
  has_many :invites, dependent: :destroy
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "assets/images/doge-default.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :name, :presence => true, format: { with:  /\A[a-zA-Z\s\.]+\z/,
    message: "only allows letters and spaces" }, length: { minimum: 1 },
    uniqueness: true
  validates :city, :presence => true, format: { with:  /\A[a-zA-Z\s\.]+\z/,
    message: "only allows letters and spaces" }, length: { minimum: 1 }
  validates :email, :presence => true
end
