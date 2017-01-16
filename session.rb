require_relative 'game'
require_relative 'player'

class Session

  def initialize
    @players = [
      Player.new("John", :X),
      Player.new("Sasha", :O)
    ]
    @ties = 0
    play_loop
  end

  def play_loop
    puts "Welcome to TicTacToe"
    loop do
      puts "Starting a new game."
      play_a_game
      puts display_score
      print "Play again?(y/n)\n"
      answer = gets[0].upcase
      break  unless answer == "Y"
    end
    puts "Goodbye"
  end

  def play_a_game
    game = Game.new(@players)
    winner = game.play_game_until_ends
    update_score(winner)
  end

  private 

    def update_score(winner)
      if winner
        puts "#{winner.name} won!"
        winner.increment_score
      else
        puts "The game was a tie!"
        @ties += 1
      end
    end

    def display_score
      scores_array = @players.map { |p| "#{p.name}: #{p.score}" }
      scores_array << "Ties: #{@ties}"
    end
end
