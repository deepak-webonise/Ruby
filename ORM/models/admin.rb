# /usr/bin/ruby -w
class Admin < Person
  has_many :accounts
end