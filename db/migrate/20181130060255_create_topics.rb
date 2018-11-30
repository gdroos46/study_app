class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.belongs_to :user
      t.integer :name
      t.text :description
      t.string :image

      t.timestamps
    end
    add_index :topic, [:user_id]
  end
end
