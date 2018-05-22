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

  def set_coordinates
    @coordinates = @coordinates.each do |coordinate|
      @board[coordinate][0] = true
      @board[coordinate][1] = " "
    end
    @board
  end

  def display_board
    board = [
     '=================',
      'Computer Player',
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
end
