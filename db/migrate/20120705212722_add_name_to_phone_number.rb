class AddNameToPhoneNumber < ActiveRecord::Migration
  def change
    add_column :phone_numbers, :name, :string

  end
end
