class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :message
      t.string :name
      t.integer :picture_id

      t.timestamps
    end
  end
end
