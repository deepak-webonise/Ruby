# /usr/bin/ruby -w
require 'modules/file_operations'
require 'classes/product'
# Order Class
class Order
  attr_accessor :id, :product_id, :product_name, :credit_card, :ccv
  def initialize(order = [])
    @id = order[0]
    @product_id = order[1]
    @product_name = order[2]
    @credit_card = order[3]
    @ccv = order[4]
  end

  def place_order
  	self.id = self.id = (10 + Random.rand(99))
    FileOperations.add(self)
  end
end
