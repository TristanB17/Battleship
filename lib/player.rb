require './lib/gameboard.rb'
require './lib/rulesboard.rb'
require './lib/game_flow.rb'

class Player
  include GameBoard

  attr_reader         :board,
                      :coordinates,
                      :shots_fired

  def initialize
    @coordinates = []
    @board = generate_board
    @shots_fired = []
  end

  def generate_boats_human(pb_coordinates, destroyer_coordinates)
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
      puts "in verify_spaces_occupied"
      @coordinates.push(pb, destroy)
      @coordinates = @coordinates.flatten
      validate_coordinates
    else
      puts "Invalid input"
    end
  end

  def validate_coordinates
    verified = @coordinates.all? do |coordinate|
      @board.keys.include?(coordinate)
    end
    if verified == true
      set_coordinates
    else
      "Invalid input."
    end
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
    board.join('\n')
  end

  def set_coordinates
    @coordinates.each do |coordinate|
      set_individual_coordinate(coordinate)
    end
  end

  def set_individual_coordinate(coordinate)
    if @board[coordinate][1] = ' '
      @board[coordinate][1] = 'S'
      @board[coordinate][0] = true
    end
  end

  def board_stays_after_update
    display_board
  end

  def take_fire(missile)
    if @board[missile][0] == true
      @board[missile][0] = false
      @board[missile][1] = "H"
    else
      @board[missile][1] = "M"
    end
  end

  def input_attack_coordinates
    coordinate = gets.chomp
    if @board.keys.include?(coordinate) == true && @shots_fired.include?(coordinate) == false
      @shots_fired << coordinate
    else
      puts "Invalid input"
    end
  end

  def fire!
    @shots_fired.last
  end
end
