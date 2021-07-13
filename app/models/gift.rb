class Gift < ApplicationRecord
  validates :name, :description, presence: true

  has_many :friend_gifts
  has_many :friends, through: :friend_gifts
end
