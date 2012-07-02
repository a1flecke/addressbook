class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :value
      t.references :person

      t.timestamps
    end
    add_index :emails, :person_id
  end
end
