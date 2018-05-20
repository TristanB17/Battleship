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

  def computer_can_select_coordinate

  end
end
