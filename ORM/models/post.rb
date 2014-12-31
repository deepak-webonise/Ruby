# /usr/bin/ruby -w
class Post < ActiveRecord::Base
  belongs_to :user
end