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

  # def test_rules_board_vertical_method_returns_array
  #
  # end


end
