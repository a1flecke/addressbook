class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.references :comments
      t.references :famlies
      t.references :addresses
      t.references :tags
      t.string :anniversary
      t.references :phoneNumbers
      t.string :date_deleted
      t.integer :is_deleted

      t.timestamps
    end
    add_index :families, :comments_id
    add_index :families, :famlies_id
    add_index :families, :addresses_id
    add_index :families, :tags_id
    add_index :families, :phoneNumbers_id
  end
end
