class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string  :name
      t.string  :nickname
      t.integer :likes
      t.string  :publication_date
      t.string  :photo_url
      t.boolean :display_in_stocks, default: false

      t.timestamps
    end
  end
end
