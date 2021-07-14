class Gift < ApplicationRecord
  belongs_to :friend
  validates :name, :description, :status, presence: true
  enum status: { pending: 0, purchased: 1 }

end
