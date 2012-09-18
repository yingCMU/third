class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.datetime :time
      t.integer :user_id
      t.string :place
      t.string :title
      t.string :details

      t.timestamps
    end
  end
end
