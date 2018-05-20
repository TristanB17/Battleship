require './test/test_helper.rb'
require './lib/gameboard.rb'
require './lib/player.rb'
require 'pry'

class PlayerTest < Minitest::Test
  def setup
    @player = Player.new
  end

  def test_game_board_exists
    assert_instance_of Player, @player
  end

  def test_game_board_starts_with_all_false
    @player.board.values.each do |coordinate|
      assert_equal false, coordinate[0]
    end
  end

  def test_game_board_display_begins_empty
    @player.board.values.each do |coordinate|
      assert_equal " ", coordinate[1]
    end
  end
end
