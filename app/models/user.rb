class User < ApplicationRecord
  validates :name, :email, :birthday, :icon, presence: true
  validates :email, uniqueness: true

  has_many :friends
end
