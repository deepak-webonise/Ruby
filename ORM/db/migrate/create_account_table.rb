# /usr/bin/ruby -w
class CreateAccountTable < ActiveRecord::Migration
  def up
    create_table :accounts, force: true do |t|
  	  t.integer :account_no
  	  t.integer :admin_id
    end
  end

  def down
    drop_table :accounts
  end
end