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

  def receive_and_filter_input(input)
    coordinate_bank = vertical_selection.flatten.flatten
    coordinate_check = input.all? do |coordinate|
      coordinate_bank.include?(coordinate)
    end
    if coordinate_check == true
      find_alignment(input)
    else
      return @coordinates
    end
  end

  def find_alignment(default = vertical_and_horizontal_coordinates, coordinates)
    if coordinates[0][0] == coordinates[1][0]
      find_row_or_column(horizontal_selection, coordinates)
    else
      find_row_or_column(vertical_selection, coordinates)
    end
  end

  def find_row_or_column(selection, coordinates)
    selection.each do |array|
      evaluate_similarity(array, coordinates)
    end
  end

  def evaluate_similarity(array, coordinates)
    thing = coordinates.all? do |single|
      array.include?(single)
    end
    if thing == true
      @coordinates << coordinates[0]
      @selected_path = array
      confirm_human_coordinate(@selected_path, coordinates[1..2])
    end
  end

  def confirm_human_coordinate(selected_path, additional_coordinates)
    confirm = additional_coordinates.all? do |additional_coordinate|
        @coordinates.include?(additional_coordinate)
    end
    if confirm == false
      additional_coordinates.each do |additional_coordinate|
        verify_human_index(selected_path, additional_coordinate)
      end
    else
      return @coordinates
    end
  end

  def verify_human_index(selected_path, additional_coordinate)
    if @coordinates.length == 2
      return verify_human_third_index(selected_path, additional_coordinate)
    end
    taken = selected_path.index(@coordinates[0])
    probe = selected_path.index(additional_coordinate)
    if taken + 1 == probe || taken - 1 == probe
      @coordinates << additional_coordinate
    else
      return @coordinates
    end
  end

  def verify_human_third_index(selected_path, additional_coordinate)
    ## .min and .max refactor, using first & second in an array
    first = selected_path.index(@coordinates[0])
    second = selected_path.index(@coordinates[1])
    probe = selected_path.index(additional_coordinate)
    if first > second && (first + 1 == probe || second - 1 == probe)
      @coordinates << additional_coordinate
    elsif second > first && (second + 1 == probe || first - 1 == probe)
      @coordinates << additional_coordinate
    else
      return @coordinates
    end
  end

  def select_path
    @selected_path = vertical_and_horizontal_coordinates.sample.sample
  end

  def select_coordinate
    coordinate = @selected_path.sample
    if @coordinates.length >= 1
      select_additional_coordinate(selected_path, coordinate)
    else
      @coordinates << coordinate
    end
  end

  def select_additional_coordinate(selected_path, additional_coordinate)
    if @coordinates.include?(additional_coordinate) == false
      verify_index(selected_path, additional_coordinate)
    else
      select_coordinate
    end
  end

  def verify_index(selected_path, additional_coordinate)
    if @coordinates.length == 2
      return verify_third_index(selected_path, additional_coordinate)
    end
    taken = selected_path.index(@coordinates[0])
    probe = selected_path.index(additional_coordinate)
    if taken + 1 == probe || taken - 1 == probe
      @coordinates << additional_coordinate
    else
      select_coordinate
    end
  end

  def verify_third_index(selected_path, additional_coordinate)
    ## .min and .max refactor, using first & second in an array
    first = selected_path.index(@coordinates[0])
    second = selected_path.index(@coordinates[1])
    probe = selected_path.index(additional_coordinate)
    if first > second && (first + 1 == probe || second - 1 == probe)
      @coordinates << additional_coordinate
    elsif second > first && (second + 1 == probe || first - 1 == probe)
      @coordinates << additional_coordinate
    else
      select_coordinate
    end
  end

  def construct_patrol_boat
    @coordinates = []
    select_path
    select_coordinate
    select_coordinate
    @coordinates
  end

  def construct_destroyer
    @coordinates = []
    select_path
    select_coordinate
    select_coordinate
    select_coordinate
    @coordinates
  end


end
