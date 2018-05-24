require './test/test_helper.rb'
require './lib/gameboard.rb'
require './lib/player.rb'
require 'pry'

class PlayerTest < Minitest::Test
  def setup
    @player = Player.new
  end

  def test_player_exists
    assert_instance_of Player, @player
  end

  def test_player_attributes
    assert_instance_of Hash, @player.board
    assert_equal [], @player.coordinates
  end

  def test_asserts_good_coordinates
    @player.generate_boats_human(["D2", "D3"], ["D4", "C4", "B4"])

    assert_equal ["D2", "D3", "D4", "C4", "B4"], @player.validate_coordinates
  end

  def test_rejects_bad_coordinates
    @player.generate_boats_human(["D4", "D3"], ["D4", "C4", "B4"])

    assert_equal [], @player.validate_coordinates
  end

  def test_player_can_create_boats_with_good_coordinates
    @player.generate_boats_human(["D2", "D3"], ["D4", "C4", "B4"])
    clone = @player.coordinates.flatten.uniq

    assert_equal true, @player.coordinates == clone
  end

  def test_setting_coordinates_changes_player_board
    @player.generate_boats_human(["D2", "D3"], ["D4", "C4", "B4"])

    @player.set_coordinates

    assert_equal true, @player.board["D2"][0]
    assert_equal "S", @player.board["D2"][1]
    assert_equal true, @player.board["D3"][0]
    assert_equal "S", @player.board["D3"][1]

    assert_equal true, @player.board["D4"][0]
    assert_equal "S", @player.board["D4"][1]
    assert_equal true, @player.board["C4"][0]
    assert_equal "S", @player.board["C4"][1]
    assert_equal true, @player.board["B4"][0]
    assert_equal "S", @player.board["B4"][1]
  end

  def test_player_has_board_display
    skip
    assert_equal "=================
    Player
    =================
    . 1 2 3 4
    A
    B
    C
    D
    =================", @player.display_board
  end

  def test_player_board_updated_after_coordinates_set
    skip
    @player.generate_boats_human(["D2", "D3"], ["D4", "C4", "B4"])

    @player.set_coordinates

    assert_equal "\n=================\nPlayer\n=================\n. 1 2 3 4\nA    \nB    \nC    \nD    \n=================", @player.display_board
  end

  def test_player_board_can_take_fire
    @player.generate_boats_human(["D2", "D3"], ["D4", "C4", "B4"])

    @player.set_coordinates
    @player.take_fire("D3")

    assert_equal false, @player.board["D3"][0]
    assert_equal "H", @player.board["D3"][1]

    @player.take_fire("A1")

    assert_equal "M", @player.board["A1"][1]
  end
end
