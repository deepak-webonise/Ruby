# /usr/bin/ruby -w
require 'modules/file_operations'
# Product class
class Product
  attr_accessor :id, :name, :price, :company, :stock

  def initialize(product = [])
    @id = product[0]
    @name = product[1]
    @price = product[2]
    @company = product[3]
    @stock = product[4]
  end
  # save data to file
  def save
    self.id = (10 + Random.rand(99))
    FileOperations.add(self)
    puts 'Successfully Added'
  end

  # update data in the file
  def update
    msg = FileOperations.id_exist?(self) ? FileOperations.update(self) : 'Product
     Not Found'
    puts msg
  end
  # delete data from file
  def delete
    msg = FileOperations.id_exist?(self) ? FileOperations.delete(self) : 'Product
     Not Found'
    puts msg
  end
  # return the list of products.
  def list
    FileOperations.find_all(self)
  end
  # search the data in the file
  def search
    result = FileOperations.search_by_name(self)    
    result || 'Product Not Found'
  end
  # check the stock of the product
  def in_stock?
  	stock = FileOperations.search_by_name(self)
  	stock = stock[0].split(';')
  	(stock[4].to_i > 0) ? true : false
  end
  #update the count of stock after order
  def update_stock
  	product = FileOperations.search_by_name(self)
  	product = product[0].split(';')
  	self.id = product[0]
  	self.name = product[1]
  	self.price = product[2]
  	self.company = product[3]
  	self.stock = product[4].to_i - 1
  	FileOperations.update(self)
  end
end
