require './lib/gameboard.rb'
require './lib/rulesboard.rb'

class Player
  include GameBoard

  attr_reader         :board,
                      :coordinates

  def initialize
    @coordinates = []
    @board = generate_board
  end

  def generate_boats_human(pb_coordinates, destroyer_coordinates)
    patrol_boat = RulesBoard.new
    patrol_boat.find_alignment(pb_coordinates)
    ship_1_coordinates = patrol_boat.coordinates
    destroyer = RulesBoard.new
    destroyer.find_alignment(destroyer_coordinates)
    ship_2_coordinates = destroyer.coordinates
    verify_spaces_occupied(ship_1_coordinates, ship_2_coordinates)
  end

  def verify_spaces_occupied(pb, destroy)
    if destroy.include?(pb[0]) == false && destroy.include?(pb[1]) == false
      @coordinates.push(pb, destroy)
    else
      generate_boats
    end
    @coordinates = @coordinates.flatten
  end

  def coordinates_valid?
    return true if @coordinates.count == 5
  end
end
