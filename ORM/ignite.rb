# /usr/bin/ruby -w
require 'active_record'
require 'mysql2'
require './config/db_config'
require './db/schema.rb'
require './models/person'
require './models/account'
require './models/admin'
require './models/user'
require './models/post'

user = User.create(
  name: 'deepak',
  email: 'deepak.kabbur@weboniselab.com'
)

admin = Admin.create(
  name: 'admin',
  email: 'admin@weboniselab.com'
)

account = Account.create(
  account_no: '302'
)
account = admin
account.save

post = Post.create(
  title: 'ORM',
  description: 'Object Relational Mapping'
)
post = user
post.save

posts = Post.all
puts '_______________________________'
puts 'Posts'
puts '_______________________________'
posts.each  do |row|
	puts row.inspect
end
puts '_______________________________'

user.destroy
admin.destroy
account.destroy