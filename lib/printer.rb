module Printer

  def welcome
    puts "Hello and welcome to battleship!"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def instructions
    puts "You are playing against a computer that is attempting to sink your ships."
    puts "You and the computer will both place your ships on the game board, which has sixteen coordinates."
    puts"One ship is two coordinates in length, and the other is three."
    puts "After all ships are placed, you and the computer will take turns guessing the location of each other's ships via their position on the grid."
    puts "The game ends when either you or the computer's ships have all been sunk."
    puts "Please press (p) or (q) to play. Good luck!"
  end

  def place_ship_instructions
    puts "I have laid out my ships on the grid."
    puts "You now need to layout your two ships."
    puts "The first is two units long and the"
    puts "second is three units long."
    puts "The grid has A1 at the top left and D4 at the bottom right."
    puts "The ships are placed with a capital letter and a number"
    puts "that can be found on the grid with a space in between them."

    puts "Enter the squares for the two-unit ship (ie A1 A2)"
  end

  def place_destroyer_instructions
    puts "Now you must place your three unit ship (destroyer)"
    puts "The format is the same as the input for the two unit ship,"
    puts "you need only add one more space as well as a letter/number combination"

    puts "Enter the squares for the three-unit ship (ie A1 A2 A3)"
  end

  def victory
    puts "Congratulations on your victory!"
    puts "Would you like to (p)lay again? or (q)uit?"
  end

  def defeat
    puts "Congratulations on your- oh wait... you lost... against an AI that just guesses random coordinates..."
    puts "as in, completely random... like, it could hit one of your ships,"
    puts "and then just ignore it and fire again at another completely random coordinate..."
    puts "Anyway, would you like to (p)lay again? or (q)uit?"
  end
end
