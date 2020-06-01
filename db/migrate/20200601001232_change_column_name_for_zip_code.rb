
class ChangeColumnNameForZipCode < ActiveRecord::Migration

  def change
    rename_column :users, :zip, :zip_code
  end

end
