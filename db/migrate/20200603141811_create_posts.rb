
class CreatePosts < ActiveRecord::Migration
  
  def change
    create_table :posts do |t|
      t.string :name
      t.string :content
      t.integer :user_id
      t.timestamp :created_at
    end
  end
  
end
