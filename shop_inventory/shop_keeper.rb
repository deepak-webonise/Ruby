#/usr/bin/ruby -w
#Module for common functionalities
module FileOperations
  #inventory file name
  file_inventory = "files/inventory.csv"
  #open file in read mode
  def FileOperations.read_mode (file_name = "files/inventory.csv")
    begin
      return File.open(file_name,"r")

    rescue Exception => e
      puts "Error in opening file in read mode."
    end
  end

  #open file in append mode
  def FileOperations.append_mode(file_name = "files/inventory.csv")
    begin
      return File.open(file_name,"a")
    rescue Exception => e
      puts "Error in opening file in write mode."
    end
  end

  #open file in write mode
  def FileOperations.write_mode(file_name = "files/inventory.csv")
    begin
      return File.open(file_name,"w")
    rescue Exception => e
      puts "Error in opening file in write mode."
    end
  end

  def FileOperations.get_file_contents(file_name)
  end
  #Search product by name
  def FileOperations.get_product_by_name(name="")
    file = self.read_mode
    products = file.readlines    
    products.each{
      |line| product = line.split("\t")
      
      if(product[1] == name )
        
        return product
      end      
    }
    return false
  end

  #search Product by id
  def FileOperations.get_product_by_id(id="")
    file = self.read_mode
    products = file.readlines    
    products.each{
      |line| product = line.split("\t")
      
      if(product[0].to_i == id )
        return product
      end      
    }
    return false
  end

  #chech for stock availible or no
  def FileOperations.valid_order(product)
    product_details = self.get_product_by_name(product)
    
    if(product_details != false)
     
      if(product_details[4].to_i > 0)
        return product_details
      else
        puts "Out of Stock"
        return
      end
    else
        return false
    end

  end
end
#END OF MODULE

#for Shopkeer to add, edit , delete ,list and search programs
class ShopKeeper
  
  include FileOperations
  #List all the Products
  def list_products
    puts "ID \t Name \t Company \t Rate \t Stock"    
    file = FileOperations::read_mode 
    file.each {
      |line| puts line
    }
    file.close
  end

  #Search the product
  def search_product
    product = Array.new
    puts "Enter Product Name"
    product_name = gets.chomp
    product = FileOperations.get_product_by_name(product_name)
    if(product != false)
      puts "ID\t ProductName \t Company \t Rate"
      puts product.join("\t")
    else
      puts "Product Not Found"
    end
  end

  #add new product
  def add_product(product="",create = true)

    if(create == true)
      product = Array.new
      product.push(10+Random.rand(99))
    end      
    puts "Enter Product Name"
    product.push(gets.chomp)
    puts "Enter Company Name"
    product.push(gets.chomp)
    puts "Enter Price"
    product.push(gets.chomp)
    puts "Enter Stock"
    product.push(gets.chomp)
    file = FileOperations.append_mode
    file.puts(product.join("\t"))
    file.close
    puts "Successfully Product Added"
  end

  #delete product
  def delete_product
    new_list =  Array.new  
    puts "Enter ID to delete"
    id = gets.chomp.to_i  
    product_del = FileOperations.get_product_by_id(id)
    if(product_del != false)
      file = FileOperations::read_mode
      products = file.readlines    
      products.each{
        | line| product = line.split("\t")      
        if(product[0].to_i != product_del[0].to_i )
          new_list.push(line)
        end      
      }
      file.close
      file = FileOperations::write_mode
      file.puts(new_list)
      file.close 
    else
      puts "Product Not Found"
    end
  end

  #edit product
  def edit_product(order = false, id = 0)
    new_list =  Array.new
    product_edit = Array.new
    if order === false
      puts "Enter ID to Edit"
      id = gets.chomp.to_i
      product = FileOperations.get_product_by_id(id)
      if(product!= false)
        product_edit.push(id)
        puts "Ente Product Name"
        product_edit.push(gets.chomp)
        puts "Enter Company Name"
        product_edit.push(gets.chomp)
        puts "Enter Price"
        product_edit.push(gets.chomp)
        puts "Enter Availible Stock"
        product_edit.push(gets.chomp)
      else
        puts "Product Not Found"
        return
      end
    else
      product_edit = FileOperations.get_product_by_id(id)
      product_edit[4] = product_edit[4].to_i - 1
    end

    file = FileOperations::read_mode
      products = file.readlines
      products.each{
        | line| product = line.split("\t")      
        if(product[0].to_i != product_edit[0].to_i )
          new_list.push(line)
        else
          new_list.push(product_edit.join("\t"))
        end      
      }
      file.close
      file = FileOperations::write_mode
      file.puts(new_list)
      file.close 

  end
end
#END OF SHOPKEEPER CLASS

#User class
class User
  include FileOperations
  #List the products
  def list_products
    puts "\tProductName \t Company \t Rate"
    file = FileOperations::read_mode 
    products = file.readlines
    products.each{
      |line| puts line.split("",3).last      
    }
    file.close
  end

  #Search the product
  def search_product
    product = Array.new
    puts "Enter Product Name"
    product_name = gets.chomp
    product = FileOperations.get_product_by_name(product_name)
    if(product != false)
      product[0] = ""
      puts "ProductName \t Company \t Rate"
      puts product.join("\t")
    else
      puts "Product Not Found"
    end
  end

  #User buy/order a product
  def order
    order = Array.new
    puts "Enter Product Name"
    product_name = gets.chomp
    order.push(10+Random.rand(99))
    order.push(FileOperations.valid_order(product_name))
    if(order[1] != false)
      puts "Enter credit card number"
      order.push(gets.chomp)
      puts "Enter CVV card number"
      order.push(gets.chomp)
      shopkeeper = ShopKeeper.new      
      shopkeeper.edit_product(true, order[1].to_i)
      file = FileOperations.append_mode("files/orders.csv")
      file.puts(order.join("\t"))      
      file.close               
      puts "Order Successfully Placed"    
    else
      puts "Product Not Found"
      self.order
    end
  end  
end
#END OF USER CLASS
#Main class which initialise the shokeepr and user class
class Main
  def initialize 
    system("clear")
    puts "Are you ?"
    puts "1. Shopkeer"
    puts "2. User"
    puts "Enter menu number :"
    case gets.chomp.to_i
    when 1 then self.shopkeeper_menu
    when 2 then self.user_menu
    else puts "Invalid Choice"
    end
  end
  def user_menu
    system("clear")
    user = User.new
    puts "1. List Product"
    puts "2. Search Product by name"
    puts "3. Buy Product"
    puts "Enter menu number :"
    case gets.chomp.to_i
    when 1 then user.list_products
    when 2 then user.search_product
    when 3 then user.order
    else
      puts "Invalid Choice"
      self.user_menu
    end
  end
  def shopkeeper_menu
    system("clear")
    shopkeeper = ShopKeeper.new
    puts "1. List Product"
    puts "2. Search Product by name"
    puts "3. Add Product"
    puts "4. Edit Product"
    puts "5. Delete Product"
    puts "Enter menu number :"
    case gets.chomp.to_i
    when 1 then shopkeeper.list_products                
    when 2 then shopkeeper.search_product
    when 3 then shopkeeper.add_product
    when 4 then shopkeeper.edit_product
    when 5 then shopkeeper.delete_product
    else
      puts "Invalid Choice"
      self.shopkeeper_menu
    end
  end
end
#END OF MAIN CLASS
obj = Main.new
