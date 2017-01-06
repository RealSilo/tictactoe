require_relative 'game'
require_relative 'player'

players = [
  Player.new("John", :X),
  Player.new("Sasha", :O)
]

game = Game.new(players)

puts "Welcome to TicTacToe"
puts "It's player one's turn."
game.print_board
puts "Player one, pick a move."
game.play_turn(players[0])
game.print_board
#TODO play turn(player)

  #TODO: Get a move from player one

  #TODO: Mark that place on the board

  #TODO: Check for a winner