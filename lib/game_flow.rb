require './lib/computer_player.rb'
require './lib/player.rb'

class GameFlow
  attr_reader   :computer_player,
                :player,
                :player_patrol_boat,
                :player_destroyer

  def initialize
    @computer_player = ComputerPlayer.new
    @player = Player.new
    @player_patrol_boat = []
    @player_destroyer = []
  end

  def computer_deploy_fleet
    @computer_player.generate_boats
    @computer_player.set_coordinates
  end

  def computer_firing_sequence
    @computer.select_random_coordinate
    @player.take_fire(@computer.fire_on_player)
    @player.display_board
  end

  def get_player_patrol_boat_location
    puts "Gimme a patrol boat"
    gets.chomp
  end

  def get_player_destroyer_location
    "Gimme a destroyer"
    gets.chomp
  end

  def incorrect_input
    puts "That's wrong"
    receive_human_input
  end

  def filter_input
    input = get_player_patrol_boat_location
    if input.class == String && input.length == 5
      sort_ships(input)
    elsif input.class == String && input.length == 5
      sort_ships(input)
    elsif input.length != 5 || input.length != 8
      return incorrect_input
    else input[2] != " "
      return incorrect_input
    end
  end

  def sort_ships(input)
    if input.length == 5
      @player_patrol_boat = input.split
    else
      input.length == 8
      @player_destroyer = input.split
    end
  end

  def player_deploy_fleet
    if @player_patrol_boat != nil && @player_destroyer != nil
      @player.generate_boats_human(@player_patrol_boat, @player_destroyer)
    else
      incorrect_input
    end
  end

  def verify_second_filter
    if @player.coordinates_valid? == true
      @player.set_coordinates
    end
  end

  def ship_setting_sequence
    computer_deploy_fleet
    @computer_player.display_board
  end
end
