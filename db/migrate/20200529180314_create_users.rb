
class CreateUsers < ActiveRecord::Migration
  def change

    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :last_initial
      t.string :email
      t.string :password_digest
      t.string :phone_number
      t.string :zip
      t.string :ethnicity
      t.string :political_party

    end
  end
end
