class Dog < ApplicationRecord
  belongs_to :user
  has_attached_file :avatar, styles: { medium: "300x300>", large: "1000x1000>" }, default_url: "assets/images/doge-default.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :name, presence: true
  validates :age, presence: true
  validates_inclusion_of :sex, :in => ["Male", "Female"]
  validates_inclusion_of :vaccinated, :in => [true, false]
  validates_inclusion_of :neutered, :in => [true, false]
  validates :breed, presence: true
  validates :weight, presence: true
end
