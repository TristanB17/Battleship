require './lib/gameboard.rb'
require './lib/rulesboard.rb'
require './lib/game_flow.rb'

class ComputerPlayer
  include GameBoard

  attr_reader         :board,
                      :coordinates,
                      :shots_fired

  def initialize
    @board = generate_board
    @coordinates = []
    @shots_fired = []
  end

  def generate_boats
    patrol_boat = RulesBoard.new.construct_patrol_boat
    destroy = RulesBoard.new.construct_destroyer
    verify_spaces_occupied(patrol_boat, destroy)
  end

  def verify_spaces_occupied(patrol_boat, destroyer)
    if destroyer.include?(patrol_boat[0]) == false && destroyer.include?(patrol_boat[1]) == false
      @coordinates.push(patrol_boat, destroyer)
    else
      generate_boats
    end
    @coordinates = @coordinates.flatten
  end

  def set_coordinates
    @coordinates.each do |coordinate|
      set_individual_coordinate(coordinate)
    end
  end

  def set_individual_coordinate(coordinate)
    if @board[coordinate][1] = ' '
      @board[coordinate][0] = true
    end
  end

  def display_board
    board = [
      '=================',
    'Computer Player',
    '=================',
    '. 1 2 3 4',
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
      @board[missile][1] = 'H'
    else
      @board[missile][1] = 'M'
    end
  end

  def select_random_coordinate
    random_coordinate = @board.keys.sample
    computer_shots_fired(random_coordinate)
    random_coordinate
  end

  def computer_shots_fired(random_coordinate)
    if @shots_fired.include?(random_coordinate) == false
      @shots_fired << random_coordinate
    else
      select_random_coordinate
    end
  end

  def fire_on_player
    @shots_fired.last
  end
end
