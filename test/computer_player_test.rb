require './test/test_helper.rb'
require './lib/gameboard.rb'
require './lib/computer_player.rb'
require 'pry'

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

  def test_game_board_starts_with_empty_space
    @cp.board.values.each do |coordinate|
      assert coordinate[1] == " "
    end
  end

  def test_computer_can_select_coordinates_that_do_not_conflict_with_each_other
    @cp.generate_boats
    clone = @cp.coordinates.flatten.uniq
    assert_equal true, @cp.coordinates == clone
  end

  def test_setting_coordinates_changes_computer_board
    @cp.verify_spaces_occupied(["D2", "D3"], ["D4", "C4", "B4"])

    @cp.set_coordinates

    assert_equal true, @cp.board["D2"][0]
    assert_equal " ", @cp.board["D2"][1]
    assert_equal true, @cp.board["D3"][0]
    assert_equal " ", @cp.board["D3"][1]

    assert_equal true, @cp.board["D4"][0]
    assert_equal " ", @cp.board["D4"][1]
    assert_equal true, @cp.board["C4"][0]
    assert_equal " ", @cp.board["C4"][1]
    assert_equal true, @cp.board["B4"][0]
    assert_equal " ", @cp.board["B4"][1]
  end

  def test_coordinates_fired_returns_empty_array
    assert_equal [], @cp.shots_fired
  end

  def test_select_random_coordinate_returns_valid_string
    assert_instance_of String, @cp.select_random_coordinate
    assert_equal 1, @cp.shots_fired.count
  end

  def test_computer_can_fire_multiple_shots
    @cp.select_random_coordinate
    @cp.select_random_coordinate
    @cp.select_random_coordinate

    assert_equal 3, @cp.shots_fired.count
    assert_equal @cp.shots_fired[-1], @cp.fire_on_player
  end

  def test_computer_can_take_fire
    @cp.verify_spaces_occupied(["D2", "D3"], ["D4", "C4", "B4"])

    @cp.set_coordinates
    coordinate = "A1"

    @cp.take_fire(coordinate)

    assert_equal false, @cp.board[coordinate][0]
    assert_equal "M", @cp.board[coordinate][1]
  end
end
