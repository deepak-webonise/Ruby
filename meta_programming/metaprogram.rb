#/usr/bin/ruby -w
require "csv.rb"
#CSV file path 
file_path = "states.csv"

#csv file parsing options
csv_options = {:headers => true,:col_sep => ",",:header_converters => :symbol,:converters => :all}

#CSV file reading and storing in csv_content
csv_content = CSV.read(file_path, csv_options)

#Extracting class name from file
class_name = File.basename(file_path,"s.csv").capitalize

#setting class name as constant
Object.const_set(class_name,Class.new)
class_csv=  Object.const_get(class_name)
class_csv.class_eval{
  define_method :convert_csv_values do
    csv_content.each do  |row|
      obj_csv = class_csv.new
      row.each do |instance_var, instance_val|
        class_csv.class_eval{attr_accessor instance_var}
        obj_csv.instance_variable_set("@#{instance_var}",instance_val)
      end
      puts obj_csv.inspect
    end
  end 
}

#object of state class
obj_state = class_csv.new
obj_state.send(:convert_csv_values)
