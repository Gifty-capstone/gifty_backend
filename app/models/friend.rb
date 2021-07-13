class Friend < ApplicationRecord
  validates :name, :birthday, :icon, presence: true

  belongs_to :user
  has_many :friend_gifts
  has_many :gifts, through: :friend_gifts
end
