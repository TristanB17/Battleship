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
    binding.pry
    patrol_boat = RulesBoard.new
    patrol_boat.receive_and_filter_input(pb_coordinates)
    ship_1_coordinates = patrol_boat.coordinates
    destroyer = RulesBoard.new
    destroyer.receive_and_filter_input(destroyer_coordinates)
    ship_2_coordinates = destroyer.coordinates
    verify_spaces_occupied(ship_1_coordinates, ship_2_coordinates)
  end

  def verify_spaces_occupied(pb, destroy)
    if destroy.include?(pb[0]) == false && destroy.include?(pb[1]) == false
      @coordinates.push(pb, destroy)
      @coordinates = @coordinates.flatten
    else
      return @coordinates = []
    end
  end

  def coordinates_valid?
    if @coordinates != false && @coordinates.count == 5
      return true
    else
      return false
    end
  end

  def set_coordinates
    @coordinates = @coordinates.each do |coordinate|
      @board[coordinate][0] = true
      @board[coordinate][1] = "S"
    end
    @board
  end

  def display_board
    board = ['=================',
      'Player',
     '=================',
     ". 1 2 3 4",
    "A #{@board["A1"][1]} #{@board["A2"][1]} #{@board["A3"][1]} #{@board["A4"][1]}",

    "B #{@board["B1"][1]} #{@board["B2"][1]} #{@board["B3"][1]} #{@board["B4"][1]}",

    "C #{@board["C1"][1]} #{@board["C2"][1]} #{@board["C3"][1]} #{@board["C4"][1]}",

    "D #{@board["D1"][1]} #{@board["D2"][1]} #{@board["D3"][1]} #{@board["D4"][1]}",

    '================='
  ]
  board.join("\n")
  end

  def take_fire(missile)
    if @board[missile][0] == true
      @board[missile][0] = false
      @board[missile][1] = "H"
    else
      @board[missile][1] = "M"
    end
  end
end
