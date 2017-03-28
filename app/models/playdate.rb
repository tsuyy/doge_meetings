class Playdate < ApplicationRecord
  belongs_to :user
  has_many :invites, dependent: :destroy
  validates :location, presence: true
  validates :date, presence: true
  validates :description, presence: true
  validates :title, presence: true
end
