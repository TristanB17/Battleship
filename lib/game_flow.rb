class GameFlow
  attr_reader   :computer_player,
                :player

  def initialize
    @computer_player = ComputerPlayer.new
    @player = Player.new
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

  def receive_human_input
    coordinates = gets.chomp
    filter_input(coordinates)
  end

  def filter_input(input)
    if input == nil
      return false
    end
    while input != nil
      case
      when input.class != String
        then false
      when input.length != 5 || input.length != 8
        then false
      when input[2] != " "
        then false
      when input.chars.include?("A", "B", "C", "D") == false
        then false
      else
        sort_ships(input)
      end
    end
  end

  def sort_ships(input)
    if input.length == 5
      patrol_boat_position(input)
    else
      input.length == 8
      destroyer_position(input)
    end
  end

  def destroyer_position(input)
    input.split(//)
  end



end
