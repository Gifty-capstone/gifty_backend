class Gift < ApplicationRecord
  enum status: { pending: 0, purchased: 1 }
  validates :name, :description, :status, presence: true

  has_many :friend_gifts
  has_many :friends, through: :friend_gifts
end
