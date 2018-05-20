require './test/test_helper.rb'
require './lib/gameboard.rb'
require './lib/computer_player.rb'
require './lib/rulesboard.rb'

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

  def retrieve_initial_placement_positioning
    assert_equal 4, @rb.select_path.length
    assert_instance_of String, @rb.select_coordinate
    assert_equal 2, @rb.select_coordinate.length
    assert_equal true, @rb.select_path.include?(@rb.select_coordinate)
  end

  def selects_appropriate_second_coordinate

  end


end