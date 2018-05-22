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

  def test_player_can_create_boats_with_input
    @player.generate_boats_human(["D2", "D3"], ["D4", "C4", "B4"])
    clone = @player.coordinates.flatten.uniq

    assert_equal true, @player.coordinates == clone
  end

  def test_can_check_coordinate_validity
    @player.generate_boats_human(["D2", "D3"], ["D4", "C4", "B4"])

    assert_equal true, @player.coordinates_valid?
  end

  def test_can_reject_coordinate_validity
    @player.generate_boats_human(["D4", "D3"], ["D4", "C4", "B4"])

    assert_equal false, @player.coordinates_valid?
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

  def test_computer_has_board_display
    assert_equal "=================
    +Computer Player
    +=================
    +. 1 2 3 4
    +A
    +B
    +C
    +D
    +=================", @player.display_board
  end

  def test_board_updated_after_coordinates_set
    @player.generate_boats_human(["D2", "D3"], ["D4", "C4", "B4"])

    @player.set_coordinates

    assert_equal "=================
    +Player
    +=================
    +. 1 2 3 4
    +A
    +B
    +C
    +D
    +=================", @player.display_board
  end
end
