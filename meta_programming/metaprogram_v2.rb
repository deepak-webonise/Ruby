# /usr/bin/ruby -w
require 'csv'
# Class Generate the CSV file to ruby Class
class Generate
  FILE_NAME = 'states.csv'
  attr_accessor :klass
  def initialize(csv_name = FILE_NAME)
    @csv_file = csv_name
    csv_options = { headers: true, col_sep: ',',
                    header_converters: :symbol, converters: :all }
    @csv_content = CSV.read(@csv_file, csv_options)
  end

  def generate_class
    @klass = Object.const_set(File.basename(@csv_file, 's.csv').capitalize,
                              Class.new)
  end

  def attributes
    @csv_content.headers
  end

  def generate_instance_var
    attribute = attributes
    @klass.instance_eval do
      attribute.map do
        |ins_var| attr_accessor ins_var.to_sym
      end
    end
  end

  def convert_row_obj
    obj_klass = @klass.new
    @csv_content.each do |row|
      row.each do |instance_var, val|
        obj_klass.instance_variable_set("@#{instance_var}", val)
      end
      puts obj_klass.inspect
    end
  end
end
obj_csv = Generate.new 'states.csv'
obj_csv.generate_class
obj_csv.generate_instance_var
obj_csv.convert_row_obj
