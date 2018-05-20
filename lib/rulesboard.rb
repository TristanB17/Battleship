require './lib/computer_player.rb'
require './lib/player.rb'

class RulesBoard
  attr_reader   :coordinates,
                :selected_path

  def initialize(coordinates = [])
    @coordinates = coordinates
    @selected_path = nil
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
    @selected_path = vertical_and_horizontal_coordinates.sample.sample
  end

  def select_coordinate
    coordinate = @selected_path.sample
    @coordinates << coordinate
    coordinate
  end

  def select_second_coordinate(selected_path)
    second_coordinate = selected_path.sample
    if @coordinates.exclude?(second_coordinate)
      check_index(second_coordinate)
    end
  end

  def verify_index(selected_path, second_coordinate)
    taken = @coordinates[0]
    

  end






end
