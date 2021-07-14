class DropIconFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :icon
  end
end
