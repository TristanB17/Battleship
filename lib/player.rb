require './lib/gameboard.rb'

class Player
  include GameBoard

  attr_reader         :board

  def initialize
    @board = generate_board
  end
end
