# /usr/bin/ruby
class Account < ActiveRecord::Base
  belongs_to :admin
end