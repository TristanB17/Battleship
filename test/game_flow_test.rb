require './test/test_helper.rb'
require './lib/computer_player.rb'
require './lib/player.rb'
require './lib/game_flow.rb'
require 'pry'

class GameFlowTest < Minitest::Test
  def setup
    @gameflow = GameFlow.new
  end

  def test_gameflow_exists_and_has_attributes
    assert_instance_of GameFlow, @gameflow
    assert_instance_of ComputerPlayer, @gameflow.computer_player
    assert_instance_of Player, @gameflow.player
  end

  def test_players_start_with_blank_board
    assert_equal "A1", @gameflow.computer_player.board.keys[0]
    assert_equal "A1", @gameflow.player.board.keys[0]

    assert_equal false, @gameflow.computer_player.board.values[0][0]
    assert_equal false, @gameflow.player.board.values[0][0]

    assert_equal " ", @gameflow.computer_player.board.values[0][1]
    assert_equal " ", @gameflow.player.board.values[0][1]
  end

  def test_player_coordinates_can_be_verified
    skip
    @gameflow.filter_input_1("A1 A2")
    @gameflow.filter_input_1("A3 B3 C3")
    @gameflow.player_deploy_fleet
  end

  def test_player_coordinates_can_be_rejected
    skip
    @gameflow.filter_input_1("A1 A6")
    @gameflow.filter_input_1("A3 B3 C3")
    @gameflow.player_deploy_fleet
  end
end
