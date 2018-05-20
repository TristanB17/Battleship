require './lib/computer_player.rb'
require './lib/player.rb'

class RulesBoard
  attr_reader   :coordinate

  def initialize(coordinate)
    @coordinate = coordinate
  end
end
