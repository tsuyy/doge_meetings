class User < ApplicationRecord
  has_secure_password
  has_many :playdates, dependent: :destroy
  has_many :dogs, dependent: :destroy
  has_many :invites, dependent: :destroy
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "assets/images/doge-default.png",
        :storage => :cloudinary, 
        :path    => ':id/:style/:filename'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  # names do NOT need to be unique.
  # also might contain other special characters.
  # http://www.kalzumeus.com/2010/06/17/falsehoods-programmers-believe-about-names/
  validates :name, :presence => true, format: { with:  /\A[a-zA-Z\s\.]+\z/,
    message: "only allows letters and spaces" }, length: { minimum: 1 },
    uniqueness: true
  # many of the same comments about over-active validations.
  validates :city, :presence => true, format: { with:  /\A[a-zA-Z\s\.]+\z/,
    message: "only allows letters and spaces" }, length: { minimum: 1 }
  # would be nice to check that this could be a valid email.
  validates :email, uniqueness: true, presence: true
  # please require good passwords.
  validates :password, presence: true
end
