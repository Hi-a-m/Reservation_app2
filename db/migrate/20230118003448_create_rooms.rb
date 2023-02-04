class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.string :introduction
      t.integer :price
      t.string :address
      t.string :image
      t.integer :people
      t.integer :room_id
      t.integer :user_id
      t.integer :start_date
      t.integer :end_date

      t.timestamps
    end
  end
end
