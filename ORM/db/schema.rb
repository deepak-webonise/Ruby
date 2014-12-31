# /usr/bin/ruby -w
ActiveRecord::Schema.define(version:20141230114930) do
  create_table :people, force: true do |t|
    t.string :name
    t.string :email
    t.string :type
  end

  create_table :posts, force: true do |t|
  	t.string :title
  	t.text :description
  	t.integer :user_id
  	t.timestamps null:false
  end

  create_table :accounts, force: true do |t|
  	t.integer :account_no
  	t.integer :admin_id
  end

end