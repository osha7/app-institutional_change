class AddCheckboxesToPledgeAttributes < ActiveRecord::Migration
  def change

    add_column :pledges, :checkbox1, :string
    add_column :pledges, :checkbox2, :string
    add_column :pledges, :checkbox3, :string
    add_column :pledges, :checkbox4, :string

  end
end
