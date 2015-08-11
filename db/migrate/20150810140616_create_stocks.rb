class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :start_date
      t.string :expiration_date
      t.string :expiration_time
      t.string :number_of_the_winners
      t.string :hashtag
      t.boolean :is_valid, default: true

      t.timestamps
    end
  end
end
