class Friend < ApplicationRecord
  validates :name, :birthday, presence: true
  belongs_to :user
  has_many :gifts

  def need_gift
    this_years_bday = Date.new(Time.zone.now.year, birthday.month, birthday.day)
    need = gifts.where(updated_at: this_years_bday.prev_year..this_years_bday)
    need.count.zero?
  end
end
