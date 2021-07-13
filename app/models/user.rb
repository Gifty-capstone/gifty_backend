class User < ApplicationRecord
  validates :name, :email, :birthday, :icon, presence: true
  validates_uniqueness_of :email

  has_many :friends

end
