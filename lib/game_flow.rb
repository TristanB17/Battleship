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
    input = gets.chomp
    filter_input_1(input)
  end

  def get_player_destroyer_location
    puts "Gimme a destroyer"
    input = gets.chomp
    filter_input_1(input)
  end

  def incorrect_input
    puts "That's wrong"
    get_player_patrol_boat_location
  end

  def filter_input_1(input)
    verified = input.to_s.split(" ").all? do |coordinate|
      @player.board.keys.include?(coordinate)
    end
    if verified == true
      sort_ships(input.split(" "))
    else
      incorrect_input
    end
  end

  # def filter_input_2(input)
  #   sort_ships_2(input)
  #   puts "I made it to filter_input_2"
  #   # if input.class == String
  #   # elsif input.length != 5 || input.length != 8
  #   #   return incorrect_input
  #   # else input[2] != " "
  #   #   return incorrect_input
  #   # end
  #   # puts "I made it to the end of input 2"
  # end


  def sort_ships(input)
    if input.size == 2
      @player_patrol_boat = input
    elsif input.size == 3
      @player_destroyer = input
    else
      incorrect_input
    end
  end

  def player_deploy_fleet
    @player.generate_boats_human(@player_patrol_boat, @player_destroyer)
    puts "fleet deployed"
    puts @player.display_board
    puts "I did the thing"
  end

  def ship_setting_sequence
    computer_deploy_fleet
    get_player_patrol_boat_location
    get_player_destroyer_location
    player_deploy_fleet
    puts @computer_player.display_board
    puts @player.display_board
  end

  def get_new_coordinates
    exchange_fire_sequence
  end

  def exchange_fire_sequence
    loop do
      break if computer_player_defeated?
      puts "Please enter firing position"
      commence = @player.input_attack_coordinates
      if commence == nil
        puts "Invalid input"
        get_new_coordinates
      end
      @computer_player.take_fire(@player.fire!)
      puts @computer_player.display_board
      break if player_defeated?
      puts "Now it's my turn..."
      sleep(2)
      @computer_player.select_random_coordinate
      player.take_fire(@computer_player.fire_on_player)
      puts @player.display_board
      # if player_defeated? == true
      #   break
      # end
      # if computer_player_defeated? == true
      #   break
      # end
    end
  end

  def player_defeated?
    defeated = @player.coordinates.all? do |coordinate|
      @player.board[coordinate][0] == false
    end
  end

  def computer_player_defeated?
    defeated = @computer_player.coordinates.all? do |coordinate|
      @computer_player.board[coordinate][0] == false
    end
  end

  def repeat_fire
    exchange_fire_sequence
  end
end
