class CreateFriendGifts < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_gifts do |t|
      t.references :friend, foreign_key: true
      t.references :gift, foreign_key: true

      t.timestamps
    end
  end
end
