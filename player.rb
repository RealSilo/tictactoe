class Player
  attr_reader :marker

  ROW_MAP = (:A..:Z).zip(0..25).to_h

  def initialize(name, marker)
    @name = name
    @marker = marker
    @score = 0
  end

  def get_move
    #[get_row, get_col]
    [get_coordinate("row"), get_coordinate("column")]
  end

  private

    def get_coordinate(row_or_column)
      loop do
        print choice_prompt(row_or_column)
        input = gets
        choice = send("translate_#{row_or_column}".to_sym, input)
        return choice if valid_choice?(choice)
        puts "Invalid #{row_or_column}"
      end
    end

    def translate_row(input)
      ROW_MAP[input[0].upcase.to_sym]
    end

    def translate_column(input)
      input.to_i - 1
    end

    def valid_choice?(choice)
      choice if (0..2).include?(choice)
    end

    def choice_prompt(row_or_column)
      "pick a #{row_or_column}\n> "
    end
end
