# usr/bin/ruby -w
# Datastructure as Graph and Wornsdroff algorithm.
class Graph
  Knight_next_move = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], 
                        [1, 2], [2, -1], [2, 1]]
  def initialize(no_rows, no_cols)
    @board = Array.new(no_rows) { Array.new(no_cols) }
    @path = Array.new(no_rows) { Array.new(no_cols) { '-' } }
    @count = 0 # to count no. moves by knight    
    no_rows.times do |row|
      no_cols.times do |col|
        @board[row][col] = Vertex.new Array.new, row, col
      end
    end
  end

  def valid_squre?(row, col)
    row >= 0 && row < @board.length && col >= 0 && col < @board.length
  end

  def push_valid_moves(square)
    Knight_next_move.each do |value|
      row = square.row + value[0]
      col = square.col + value[1]
      (valid_squre? row, col) && square.edges.push(@board[row][col])
    end
  end

  def generate_moves
    @board.each do |row|
      row.each do |square|
        push_valid_moves(square)
      end
    end
  end

  def start_move(row, col)
    warnsdorf_algorithm @board[row][col]
  end
  # This method used to print the path of knight in matrix form.
  def print_board
  	puts '___________________________________________'
    puts @count == @board.length**2 ? 'Knight Tour Completed' : 'Incomplete'\
    ' tour of Knight'
    puts '___________________________________________'
    @path.length.times do |row|
      @path.length.times do |col|
        print "\s #{@path[row][col]} \s"
      end
      puts
    end
    puts '___________________________________________'
  end

  def find_min_moves(next_moves)
    min_vertex = next_moves[0]
    next_moves.each do |vertex|
      min_vertex.edges.length > vertex.edges.length && min_vertex = vertex
    end
    min_vertex
  end

  def warnsdorf_algorithm(current_square)
    current_square.visited = true
    next_moves = []
    @path[current_square.row][current_square.col] = @count += 1
    current_square.edges.each do |vertex|
      vertex.visited || next_moves.push(vertex)
    end
    min_moves_square = find_min_moves next_moves
    min_moves_square && (warnsdorf_algorithm min_moves_square)
  end
end

# Class Vertex : create a object for each square in board
class Vertex
  attr_reader :row, :col
  attr_accessor :visited, :edges
  def initialize(edges, row, col)
    @edges = edges
    @row = row
    @col = col
    @visited = false
  end
end

obj_graph = Graph.new 5, 5
obj_graph.generate_moves
obj_graph.start_move 0, 0
obj_graph.print_board
