class Friend < ApplicationRecord
  validates :name, :birthday, :icon, presence: true

  belongs_to :user
  has_many :friend_gifts
  has_many :gifts, through: :friend_gifts

  def need_gift
    this_years_bday = Date.new(Time.now.year, birthday.month, birthday.day)
    need = gifts.where(updated_at: this_years_bday.prev_year.. this_years_bday)
     if need.count == 0
      true
     else
      false
     end
  end
end
