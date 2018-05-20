require './test/test_helper.rb'
require './lib/gameboard.rb'
require './lib/computer_player.rb'
require './lib/rulesboard.rb'

class RulesBoardTest < Minitest::Test

  def setup
    @rb = RulesBoard.new("A1")
  end

  def test_rules_board_exists_and_has_attributes
    assert_instance_of RulesBoard, @rb
    assert_equal "A1", @rb.coordinate
  end

  def test_rules_board_horizontal_selection_returns_array
    expected = [
      ["A1", "A2", "A3", "A4"],
      ["B1", "B2", "B3", "B4"],
      ["C1", "C2", "C3", "C4"],
      ["D1", "D2", "D3", "D4"],
    ]
    assert_equal expected, @rb.horizontal_selection
  end

  def test_rules_board_vertical_selection_returns_array
    expected = [
      ["A1", "B1", "C1", "D1"],
      ["A2", "B2", "C2", "D2"],
      ["A3", "B3", "C3", "D3"],
      ["A4", "B4", "C4", "D4"],
    ]
    assert_equal expected, @rb.vertical_selection
  end


end
