#/usr/bin/ruby -w
#small "Hello World" program and simple iterators

puts "Hello World"

def multiplier num
    return Proc.new {|n| puts "#{num} x #{n} = #{num * n}"}
end

#Prints even numbers
puts "<<<<Even Numbers>>>>"
10.times {
    |n| puts n if n%2 == 0
}

#Prints Multiplier of user input
begin
    puts "Enter Number"
    user_input = gets
    number = multiplier Integer(user_input)
    puts "<<<<multipliers>>>>"
    (1..10).each{
        |mul| number.call(mul)
    }
rescue Exception => e
    puts "Invalid Number. Please enter valid number"
    retry
end