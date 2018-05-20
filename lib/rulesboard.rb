require './lib/computer_player.rb'
require './lib/player.rb'

class RulesBoard
  attr_reader   :computer_coordinates

  def initialize
    @computer_coordinates = []
  end

  def horizontal_selection
    [
      ["A1", "A2", "A3", "A4"],
      ["B1", "B2", "B3", "B4"],
      ["C1", "C2", "C3", "C4"],
      ["D1", "D2", "D3", "D4"],
    ]
  end

  def vertical_selection
    [
      ["A1", "B1", "C1", "D1"],
      ["A2", "B2", "C2", "D2"],
      ["A3", "B3", "C3", "D3"],
      ["A4", "B4", "C4", "D4"],
    ]
  end

  def vertical_and_horizontal_coordinates
    [horizontal_selection, vertical_selection]
  end

  def select_path
    vertical_and_horizontal_coordinates.sample.sample
  end

  def select_coordinate
    select_path.sample
  end
end
