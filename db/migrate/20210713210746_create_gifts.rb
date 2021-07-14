class CreateGifts < ActiveRecord::Migration[5.2]
  def change
    create_table :gifts do |t|
      t.string :name
      t.string :description
      t.integer :status
      t.timestamps
    end
  end
end
