class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.integer  :user_id
      t.string   :name
      t.text     :description
      t.string   :image
      t.string   :status, default: :draft
      t.timestamps
    end
  end
end
