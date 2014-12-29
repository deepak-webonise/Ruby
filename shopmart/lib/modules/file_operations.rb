# /usr/bin/ruby -w
# Fileoperations Module
module FileOperations
  FILE_PATH = 'lib/database/'
  def self.read_mode(file_name)
  	begin
      File.open(FILE_PATH + file_name, 'r').readlines	
  	rescue Exception => e
  	  puts 'Error in reading file'
  	  puts e.message
  	end
    
  end

  def self.write_mode(file_name)
    begin
      File.open(FILE_PATH + file_name, 'w')	
  	rescue Exception => e
  	  puts 'Error in reading file'
  	  puts e.message
  	end
  end

  def self.append_mode(file_name)
    begin
      File.open(FILE_PATH + file_name, 'a')	
  	rescue Exception => e
  	  puts 'Error in reading file'
  	  puts e.message
  	end
  end

  def self.add(obj)
    file = append_mode("#{obj.class}.csv")
    file.puts convert_obj_arr(obj).join(';')
  end

  def self.update(obj)
    new_list = []
    file = read_mode("#{obj.class}.csv")
    file.each do
      | line| row = line.split(';')
      (obj.id.to_i != row[0].to_i ) ? new_list.push(line) :
      new_list.push(convert_obj_arr(obj).join(';'))
    end
    file = write_mode("#{obj.class}.csv")
    file.puts new_list
    file.close
  end

  def self.id_exist?(obj)
    file = read_mode("#{obj.class}.csv")
    file.each do |row|
      attribute = row.split(';')
      if obj.id.to_i == attribute[0].to_i
        return true
      end
    end
    false
  end

  def self.search_by_name(obj)
    list = []
    file = read_mode("#{obj.class}.csv")
    file.each do |row|
      attribute = row.split(';')
      if obj.name.to_s == attribute[1].to_s
        list.push(row)
      end
    end
    (list.length > 0)? list : false
  end

  def self.delete(obj)
    new_list = []
    file = read_mode("#{obj.class}.csv")
    file.each do |row|
      attribute = row.split(';')
      if obj.id.to_i != attribute[0].to_i
        new_list.push(row)
      end
    end
    file = write_mode("#{obj.class}.csv")
    file.puts new_list
    file.close
  end

  def self.find_all(obj)
    read_mode("#{obj.class}.csv")
  end

  def self.convert_obj_arr(obj)
    rows = []
    obj.instance_variables.map do
      |attribute| rows.push(obj.instance_variable_get("#{attribute}").to_s)
    end
    rows
  end
end
