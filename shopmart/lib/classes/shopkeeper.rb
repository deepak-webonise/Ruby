# /usr/bin/ruby -w
require 'classes/product'
# Shopkeeper class
class Shopkeeper
  def initialize
    system('clear')
    puts 'Welcome Shopkeeper'
    menu
  end
  #Display menu to shopkeeper
  def menu
  	puts "\nMenu \n Enter menu number to select"
    puts '1. Add Product'
    puts '2. Edit Product'
    puts '3. Delete Product'
    puts '4. List Product'
    puts '5. Search Product'
    puts '6. Exit'
    puts 'Enter menu number :'
    choice = gets.to_i
    case choice
      when 1 then add_product
      when 2 then edit_product
      when 3 then delete_product
      when 4 then list_product
      when 5 then search
      when 6 then Ignite.new
      else
      	puts 'Invalid Choice'
      	menu
    end
  end
  #add new products to the database.
  def add_product
    product = Product.new
    puts 'Enter Product Name'
    product.name = gets.chomp
    puts 'Enter Product Rate'
    product.price = gets.chomp
    puts 'Enter Product Company '
    product.company = gets.chomp
    puts 'Enter Product Stock'
    product.stock = gets.chomp
    product.save
  end
  #edit exisiting products.
  def edit_product
    product = Product.new
    puts 'Enter Product Id'
    product.id = gets.chomp
    puts 'Enter Product Name'
    product.name = gets.chomp
    puts 'Enter Product Rate'
    product.price = gets.chomp
    puts 'Enter Product Company '
    product.company = gets.chomp
    puts 'Enter Product Stock'
    product.stock = gets.chomp
    product.update
  end
  #Shokeeper can delete existing product
  def delete_product
    product = Product.new
    puts 'Enter Product Id'
    product.id = gets.chomp
    product.delete
  end
  #list products to the shokeeper
  def list_product
    product = Product.new
    list = product.list
    puts '_________________________________________'
    puts "Id\tName\tPrice\tCompany\tStock"
    puts '_________________________________________'
    list.each do |row|
      puts row.split(';').join("\t")
    end
    puts '_________________________________________'
    menu
  end
  #search product by name
  def search
    product = Product.new
    puts 'Enter Product Name'
    product.name = gets.chomp
    puts product.search
  end
end
