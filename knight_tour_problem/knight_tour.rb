#/usr/bin/ruby -w 
class Board
  #initialize the chess board
  def initialize
    @board = Array.new(5){Array.new(5){0}}
    @x_move = Array[2,1,-1,-2,-2,-1,1,2]
    @y_move = Array[1,2,2,1,-1,-2,-2,-1]
  end
  #print chess board
  def print_board
    (0..4).each do |row|	
      (0..4).each do |col|
        print "\s#{@board[row][col]}\s"	      
      end	
      puts
    end
  end
  #chech for the correct move and not overridding value
  def safe_move (x, y)
    return true if (x < 5 && x >= 0 && y < 5 && y >= 0 && @board[x][y] == 0)
  end
  #Move knight
  def move (x=0, y=0, value = 1)
    next_x, next_y = 0      
    return true if value === 25
    (0..7).each do |i|
      next_x = x + @x_move[i]
      next_y = y + @y_move[i]        
      if(safe_move(next_x,next_y)) 	      
        @board[next_x][next_y] = value
        if(move(next_x,next_y,value+1) === true)
	      return true
        else
          @board[next_x][next_y] = 0
        end
      end
    end
    return false
  end
end

obj = Board.new
obj.move(0,0,1)   
obj.print_board


