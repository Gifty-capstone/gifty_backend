class AddFriendsToGifts < ActiveRecord::Migration[5.2]
  def change
    add_reference :gifts, :friend, foreign_key: true
  end
end
