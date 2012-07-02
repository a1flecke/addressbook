class ChangeFamliesToFamilies < ActiveRecord::Migration
  def up
	rename_column :families, :famlies_id, :families_id
  end

  def down
  end
end
