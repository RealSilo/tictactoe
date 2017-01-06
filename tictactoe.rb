class Board
  WIDTH = 3
  HEIGHT = WIDTH

  attr_accessor :grid

  def initialize
    @grid = Array.new(HEIGHT) { Array.new(WIDTH, :" ")  }
  end

  def print_grid
    @grid.each do |row|
      puts
      row.each do |cell|
        print "[#{cell}]"
      end
    end
    puts
  end

  def row_win?(marker)
    grid.any? do |row|
      row.all? do |cell|
        cell == marker
      end
    end
  end

  def column_win?(marker)
    (0...WIDTH).any? do |column|
      grid.all? do |row|
        row[column] == marker
      end
    end
  end

  def diagonal_win?(marker)
    [lambda { |i| i }, lambda {|i| -(i+1) }].any? do |proc|
      (0...HEIGHT).all? do |i|
        marker == grid[i][proc.(i)]
      end
    end
  end

  def [](y,x)
    grid[y][x]
  end

  def []=(y,x,param)
    if @grid[y][x] == :" " && [:X, :O].include?(param)
      grid[y][x] = param
    else
      false
    end
  end
end

b = Board.new
b.print_grid
b[0, 2] = :X
b[1, 1] = :X
b[2, 2] = :X
b.print_grid
puts b.diagonal_win?(:X)

