class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :firstName
      t.string :middleName
      t.string :lastName
      t.references :family
      t.references :emails
      t.references :phoneNumbers
      t.references :tags
      t.string :birthday
      t.string :date_deleted
      t.integer :is_deleted

      t.timestamps
    end
    add_index :people, :family_id
    add_index :people, :emails_id
    add_index :people, :phoneNumbers_id
    add_index :people, :tags_id
  end
end
