# /usr/bin/ruby -w

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

  def save
    self.id = (10 + Random.rand(99))
    FileOperations.add(self)
    puts 'Successfully Added'
  end

  def update
    msg = FileOperations.id_exist?(self) ? FileOperations.update(self) : 'Product
     Not Found'
    puts msg
  end

  def delete
    msg = FileOperations.id_exist?(self) ? FileOperations.delete(self) : 'Product
     Not Found'
    puts msg
  end

  def list
    FileOperations.find_all(self)
  end

  def search
    result = FileOperations.search_by_name(self)    
    result || 'Product Not Found'
  end

  def in_stock?
  	stock = FileOperations.search_by_name(self)
  	stock = stock[0].split(';')
  	(stock[4].to_i > 0) ? true : false
  end

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
