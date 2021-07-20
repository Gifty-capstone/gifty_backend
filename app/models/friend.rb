class Friend < ApplicationRecord
  validates :name, :birthday, presence: true
  belongs_to :user
  has_many :gifts, dependent: :destroy

  def need_gift
    this_years_bday = Date.new(Time.zone.now.year, birthday.month, birthday.day)
   if Date.today > this_years_bday
     need = gifts.where(updated_at: this_years_bday..this_years_bday + 1.year, status: "purchased")
     need.count.zero?
   else
     need = gifts.where(updated_at: this_years_bday.prev_year..this_years_bday, status: "purchased")
     need.count.zero?
   end
 end
end
