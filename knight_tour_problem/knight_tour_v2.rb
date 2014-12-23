#usr/bin/ruby -w
require 'pp'
class Graph

  def initialize(no_rows, no_cols)
    @board = Array.new(no_rows){Array.new(no_cols)}
    no_rows.times do |row|
      no_cols.times do |col|
        @board[row][col] = Vertex.new(Array.new,row,col)           
      end
    end
    print @board.length
  end
  def generate_valid_moves
    moves = Proc.new do |square|         
      [[-2,1],[-1,2],[1,2],[2,1],[2,-1],[-1,-2],[1,-2],[-2,1]].each do |value|
        row = square.row + value[0]
        col = square.col + value[1]
        if (row >= 0 && row < @board.length && col >= 0 and col < @board.length)
            square.edges.push(@board[row][col])
        end
      end      
    end

    @board.each do |row1|
      row1.each do |col|
        moves.call(col)          
      end
    end    
  end
end

class Vertex
  def initialize(edges,row,col)
    @edges = edges
    @row = row
    @col = col
    @visited = false
  end
  attr_reader:row,:col, :edges
  attr_writer:visited
end

obj_graph = Graph.new(5,5)
obj_graph.generate_valid_moves