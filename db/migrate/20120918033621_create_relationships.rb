class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :post_id

      t.timestamps
    end
  end
 add_index :relationships, :follower_id
  add_index :relationships, :post_id
  add_index :relationships, [:follower_id, :post_id], unique: true
end
