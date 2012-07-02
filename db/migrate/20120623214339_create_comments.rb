class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :value
      t.references :family

      t.timestamps
    end
    add_index :comments, :family_id
  end
end
