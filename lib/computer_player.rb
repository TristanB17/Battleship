require './lib/gameboard.rb'
require './lib/rulesboard.rb'

class ComputerPlayer
  include GameBoard

  attr_reader         :board,
                      :coordinates

  def initialize
    @board = generate_board
    @coordinates = []
  end

  def generate_boats
    pb = RulesBoard.new.construct_patrol_boat
    destroy = RulesBoard.new.construct_destroyer
    verify_spaces_occupied(pb, destroy)
  end

  def verify_spaces_occupied(pb, destroy)
    if destroy.include?(pb[0]) == false && destroy.include?(pb[1]) == false
      @coordinates.push(pb, destroy)
    else
      generate_boats
    end
    @coordinates = @coordinates.flatten
  end


end
