require './test/test_helper.rb'
require './lib/gameboard.rb'
require './lib/player.rb'

class PlayerTest < Minitest::Test
  def setup
    @player = Player.new
  end

  def test_game_board_exists
    assert_instance_of Player, player
  end

  def test_game_board_starts_with_all_false
    @player.generate_board.values each do |coordinate|
      assert coordinate[0] == false
    end
  end

  def test_game_board_starts_with_all_false
    @player.generate_board.values each do |coordinate|
      assert coordinate[1] == " "
    end
  end

end
