class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :zipCode
      t.string :date_deleted
      t.integer :is_deleted
      t.references :family

      t.timestamps
    end
    add_index :addresses, :family_id
  end
end
