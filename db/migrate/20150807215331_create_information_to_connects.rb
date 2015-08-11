class CreateInformationToConnects < ActiveRecord::Migration
  def change
    create_table :information_to_connects do |t|
      t.string :client_id
      t.string :client_secret
      t.string :code
      t.string :access_token

      t.timestamps
    end
  end
end
