class Playdate < ApplicationRecord
  belongs_to :user
  has_many :invites, dependent: :destroy
end
