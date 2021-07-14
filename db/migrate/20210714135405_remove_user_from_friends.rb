class RemoveUserFromFriends < ActiveRecord::Migration[5.2]
  def change
    remove_reference :friends, :user, foreign_key: true
  end
end
