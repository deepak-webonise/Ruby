# /usr/bin/ruby -w
class CreatePeopleTable < ActiveRecord::Migration
  def up
    create_table :people do |t|
      t.string :name
      t.string :email
      t.string :type
    end
  end
  def down
    drop_table :people
  end
end