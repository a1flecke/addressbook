class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.string :value
      t.references :person
      t.references :family

      t.timestamps
    end
    add_index :phone_numbers, :person_id
    add_index :phone_numbers, :family_id
  end
end
