require './lib/game_board.rb'

class Player 
  include GameBoard


  def initialize
    @board = generate_board
  end




end
