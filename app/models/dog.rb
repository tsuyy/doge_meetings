class Dog < ApplicationRecord
  belongs_to :user
  has_attached_file :avatar, styles: { medium: "300x300>", large: "1000x1000>" }, default_url: "assets/images/doge-default.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :name, presence: true
  validates :age, presence: true
  validates :sex, presence: true
  validates :breed, presence: true
  validates :vaccinated, presence: true
  validates :neutered, presence: true
  validates :weight, presence: true
end
