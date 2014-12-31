# /usr/bin/ruby -w
class CreatePostTable < ActiveRecord::Migration
  def up
    create_table :posts do |t|
  	  t.string :title
  	  t.text :description
  	  t.integer :user_id
  	  t.timestamps null:false
    end
  end

  def down
    drop_table :posts
  end
end