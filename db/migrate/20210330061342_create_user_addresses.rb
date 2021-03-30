class CreateUserAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :user_addresses do |t|
      t.string :postal_code,      null: false
      t.integer :state_id,        null: false
      t.string :city,             null: false
      t.string :town,             null: false
      t.string :building
      t.string :phone_number,     null: false
      t.references :user
      t.timestamps
    end
  end
end
