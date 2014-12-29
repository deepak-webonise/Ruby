# /usr/bin/ruby -w
require './classes/shopkeeper'
require './classes/product'
# require './config/config'
require './classes/customer'
require './classes/order'
require './modules/file_operations'
# Initilize the application
class Ignite
  def initialize
    system('clear')
    puts 'Welcome to Shop.'
    main_menu
  end

  def main_menu
    puts 'Are you ?'
    puts '1. Shopkeeper'
    puts '2. Customer'
    puts '3.Exit'
    puts 'Enter menu number :'
    choice = gets.to_i
    case choice
      when 1 then Shopkeeper.new
      when 2 then Customer.new
      when 3 then exit
      else
      	puts 'Invalid Choice'
      	main_menu
    end
  end
end

#Init.new

Ignite.new
# obj_shop.add_product