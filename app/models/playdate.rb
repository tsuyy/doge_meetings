class Playdate < ApplicationRecord
  belongs_to :user
  has_many :invites, dependent: :destroy
  validates :location, presence: true
  # maybe don't let people make playdates before 2016
  # it does look like that doesn't break when submitted, but client side validations or a flash message would be nice.
  validates :date, presence: true
  validates :description, presence: true
  validates :title, presence: true
end
