class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :itineraries, [:user_id, :created_at]
  end
end
