class Board
  WIDTH = 3
  HEIGHT = WIDTH

  attr_accessor :grid

  def initialize
    @grid = Array.new(HEIGHT) { Array.new(WIDTH, :" ")  }
  end

  def display
    output = "\n"
    output << generate_header
    output << generate_rows
    output << "\n"
  end

  def winner?(player)
    marker = player.marker
    row_win?(marker) || column_win?(marker) || diagonal_win?(marker)
  end

  def [](y, x)
    grid[y][x]
  end

  def place_marker(coordinates, marker)
    y, x = coordinates
    grid[y][x] = marker if @grid[y][x] == :" "
  end

  def no_more_spaces?
    @grid.all? do |row|
      row.all? do |cell|
        cell != :" "
      end
    end
  end

  private

    def generate_header
      (1..WIDTH).reduce("   ") { |header, row| header << "  #{row}" } << "\n"
    end

    def generate_rows
      letter = "@"
      @grid.reduce("") do |output, row|
        letter = letter.next
        output << format_row(row, letter)
      end
    end

    def format_row(row, letter)
      row.reduce("  #{letter} ") { |string, cell| string << "[#{cell}]" } << "\n"
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
end
