require './test/test_helper.rb'
require './lib/gameboard.rb'
require './lib/computer_player.rb'

class ComputerPlayerTest < Minitest::Test
  def setup
    @cp = ComputerPlayer.new
  end

  def test_game_board_exists
    assert_instance_of ComputerPlayer, @cp
  end

  def test_game_board_starts_with_all_false
    @cp.board.values.each do |coordinate|
      assert coordinate[0] == false
    end
  end

  def test_game_board_starts_with_empyt_space
    @cp.board.values.each do |coordinate|
      assert coordinate[1] == " "
    end
  end

  def test_computer_can_select_coordinates_that_do_not_conflict_with_each_other
    @cp.generate_boats
    clone = @cp.coordinates.flatten.uniq
    assert_equal true, @cp.coordinates == clone
  end
end
