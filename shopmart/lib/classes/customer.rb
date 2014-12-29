# /usr/bin/ruby -w
require 'classes/order'
require 'classes/product'
# Customer Class
class Customer
  def initialize
    system('clear')
    puts 'Welcome Customer'
    menu
  end
  #Menu for customers.
  def menu
  	puts 'Menu'
    puts '1. List Product'
    puts '2. Search Product'
    puts '3. Order Product'
    puts '4. Exit'
    puts 'Enter menu number'
    choice = gets.to_i
    case choice
      when 1 then list_product
      when 2 then search
      when 3 then place_order
      when 4 then Ignite.new
      else
        puts 'Invalid Choice'
        menu
    end
  end
  #List the products for customers
  def list_product
    product = Product.new
    list = product.list
     puts '_________________________________________'
    puts "Name\tPrice\tCompany\tStock"
    puts '_________________________________________'
    list.each do |row|
      puts row.split(';',2).last.split(';').join("\t")
    end
    puts '_________________________________________'
    menu
  end
  #Customer can search the product by name.
  def search
    product = Product.new
    puts 'Enter Product Name'
    product.name = gets.chomp
    puts product.search
    menu
  end
  #Customer can place order which is in stock.
  def place_order
    product = Product.new
    order =  Order.new
    puts 'Enter the product name'
    product.name = gets.chomp
    product_details =  product.search  
    if product_details
      product_details = product_details[0].split(';')
      if product.in_stock?
        order.product_id = product_details[0]
        order.product_name = product_details[1]
        puts 'Enter Credit Card  number'
        order.credit_card = gets.chomp
        puts 'Enter CCV number'
        order.ccv = gets.chomp      
      	product.update_stock
      	order.place_order
      	puts 'Placed ordered successfully'
      else
      	puts 'Product Out of stock'
      end
    else
      puts 'Product not found'
    end
    menu
  end
end
