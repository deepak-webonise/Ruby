# /usr/bin/ruby -w
ActiveRecord::Base.establish_connection({
  :adapter  => 'mysql2',
  :host     => 'localhost',
  :username => 'root',
  :password => 'root',
  :database => 'blog'
})