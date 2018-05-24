require './lib/printer.rb'
require './lib/game_flow.rb'

class Menu
  include Printer

  attr_accessor   :player_victory,
                  :computer_player_victory

  def initialize
    @player_victory = nil
    @computer_player_victory = nil
  end

  def start
    welcome
    get_menu_input
  end

  def get_instructions
    instructions
    get_menu_input
  end

  def get_menu_input
    input = gets.chomp
    if input == 'i'
      get_instructions
    elsif input =='p'
      play
    elsif input == 'q'
      exit
    else
      try_again
    end
  end

  def play
    new_game = GameFlow.new
    new_game.ship_setting_sequence
    @player_victory = new_game.computer_player_defeated?
    @computer_player_victory = new_game.player_defeated?
    play_again?
  end

  def try_again
    puts "Invalid input. Please press (p) to play, (i) for instructions, or (q) for quit."
    get_menu_input
  end

  def play_again?
    if @player_victory == true
      victory
    elsif @computer_player_victory == true
      defeat
    end
    get_menu_input
  end
end
