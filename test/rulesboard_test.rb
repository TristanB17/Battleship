require './test/test_helper.rb'
require './lib/gameboard.rb'
require './lib/computer_player.rb'
require './lib/rulesboard.rb'
require 'pry'

class RulesBoardTest < Minitest::Test
  def setup
    @rb = RulesBoard.new
  end

  def test_rules_board_exists_and_has_attributes
    assert_instance_of RulesBoard, @rb
  end

  def test_rules_board_horizontal_selection_returns_array
    expected_1 = [
      ["A1", "A2", "A3", "A4"],
      ["B1", "B2", "B3", "B4"],
      ["C1", "C2", "C3", "C4"],
      ["D1", "D2", "D3", "D4"],
    ]
    assert_equal expected_1, @rb.horizontal_selection

    expected_2 = [
      ["A1", "B1", "C1", "D1"],
      ["A2", "B2", "C2", "D2"],
      ["A3", "B3", "C3", "D3"],
      ["A4", "B4", "C4", "D4"],
    ]
    assert_equal expected_2, @rb.vertical_selection

    assert_equal [expected_1, expected_2], @rb.vertical_and_horizontal_coordinates
  end

  def test_retrieve_initial_placement_positioning
    @rb.select_path
    sample_coordinate = @rb.select_coordinate.join

    assert_equal 4, @rb.selected_path.length
    assert_instance_of String, sample_coordinate
    assert_equal 2, sample_coordinate.length

    assert_equal true, @rb.selected_path.include?(sample_coordinate)
    assert_equal sample_coordinate, @rb.coordinates[0]
  end

  def test_computer_selects_appropriate_second_coordinate
    sample_path = ["A3", "B3", "C3", "D3"]
    sample_coordinate = "A3"
    @rb.coordinates << sample_coordinate

    # assert_equal true, @rb.select_second_coordinate(sample_path, "B3")
  end

  def test_verify_index
    selected_path = ["A3", "B3", "C3", "D3"]
    sample_coordinate = "A3"

    @rb.coordinates << sample_coordinate

    assert_equal ["A3", "B3"], @rb.verify_index(selected_path, "B3")
  end

  def test_can_select_two_appropriate_coordinates
    sample_path = ["A3", "B3", "C3", "D3"]
    sample_coordinate = "A3"

    @rb.coordinates << sample_coordinate
    @rb.select_second_coordinate(sample_path, "B3")

    assert_equal 2, @rb.coordinates.length
    assert_equal "B3", @rb.coordinates[1]
  end

  def test_selects_two_appropriate_coordinates_without_input
    @rb.select_path

    @rb.select_coordinate
    @rb.select_coordinate

    assert_equal 2, @rb.coordinates.length
  end

  def test_board_can_make_patrol_boat
    @rb.construct_patrol_boat
    ship = @rb.coordinates
    assert_equal true, ship[0][0] == ship[1][0] || ship[0][1] == ship[1][1]
    assert_equal 2, @rb.coordinates.length
  end






end
