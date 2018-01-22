class AddOwnerToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :user_id, :integer, default: 1
  end
end
