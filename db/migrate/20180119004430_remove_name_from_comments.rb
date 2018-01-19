class RemoveNameFromComments < ActiveRecord::Migration[5.0]
  def up
    change_table :comments do |t|
      t.remove :name
    end
  end

  def down
    change_table :comments do |t|
      t.string :name
    end
  end
end
