class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.date :birthday
      t.integer :icon

      t.timestamps
    end
  end
end
