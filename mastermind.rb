class MasterMind

  def self.new
    p "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    option = gets.chomp
    self.run(option)
  end

  def self.run(option)
    if option == "q"
      p "Until Next Time. Muahahahahaha!"
    elsif option == "i"
      p "Try to guess the 'code' made up of four different colors in a particular order."
      self.new
    elsif option == "p"
      self.play_game
    else
      p "I'm sorry, that is not an option."
      p "Please type 'p' to play, 'i' for the instructions, or 'q' to quit"
      self.new
    end
  end

  def self.play_game

  end

end


p "Welcome to MASTERMIND"
MasterMind.new
