class AddStatusToComment < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :status, :string, default: "unapproved"
  end
end
