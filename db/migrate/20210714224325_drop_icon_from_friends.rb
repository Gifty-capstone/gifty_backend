class DropIconFromFriends < ActiveRecord::Migration[5.2]
  def change
    remove_column :friends, :icon
    add_column :friends, :memo, :text
  end
end
