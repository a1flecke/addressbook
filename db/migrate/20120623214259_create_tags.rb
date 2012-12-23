class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :value
      t.references :family

      t.timestamps
    end
    add_index :tags, :family_id
  end
end
