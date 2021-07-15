class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :name, presence: true
  validates :email, presence: true
  validates :birthday, presence: true
  has_many :friends
end
