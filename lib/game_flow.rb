class GameFlow
  attr_reader   :computer_player,
                :player

  def initialize
    @computer_player = ComputerPlayer.new
    @player = Player.new
  end

end
