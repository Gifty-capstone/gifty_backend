class DropFriendGifts < ActiveRecord::Migration[5.2]
  def change
    drop_table :friend_gifts
  end
end
