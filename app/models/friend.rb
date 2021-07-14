class Friend < ApplicationRecord
  validates :name, :birthday, :icon, presence: true

  has_many :gifts

  def need_gift
    this_years_bday = Date.new(Time.now.year, birthday.month, birthday.day)
    need = gifts.where(updated_at: this_years_bday.prev_year..this_years_bday)
    need.count == 0
  end
end
