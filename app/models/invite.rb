class Invite < ApplicationRecord
  belongs_to :user
  belongs_to :playdate
end
