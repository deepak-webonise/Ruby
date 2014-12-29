# /usr/bin/ruby -w

# Shopkeeper class
class Shopkeeper
  def initialize
    system('clear')
    puts 'Welcome Shopkeeper'
    menu
  end

  def menu
  	puts "\nMenu \n Enter menu number to select"
    puts '1. Add Product'
    puts '2. Edit Product'
    puts '3. Delete Product'
    puts '4. List Product'
    puts '5. Exit'
    puts 'Enter menu number :'
    choice = gets.to_i
    case choice
      when 1 then add_product
      when 2 then edit_product
      when 3 then delete_product
      when 4 then list_product
      when 5 then Ignite.new
      else
      	puts 'Invalid Choice'
      	menu
    end
  end

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

  def delete_product
    product = Product.new
    puts 'Enter Product Id'
    product.id = gets.chomp
    product.delete
  end

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

  def search
    product = Product.new
    puts 'Enter Product Name'
    product.name = gets.chomp
    puts product.search
  end
end
