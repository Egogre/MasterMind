class MasterMind
  CODE_COLORS = {"r": "Red", "g": "Green", "b": "Blue", "y": "Yellow"}
  CODE_OPTIONS = ["r", "g", "b", "y"]

  def self.new
    p "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    option = gets.chomp
    self.run(option)
  end

  private

  def self.run(option)
    if option == "q"
      self.evil_goodbye
    elsif option == "i"
      p "Try to guess the 'code' made up of four different colors in a particular order."
      self.new
    elsif option == "p"
      self.play_game
    else
      p "Foolish human, #{option} is not an option!"
      p "You must type 'p' to play, 'i' for the instructions, or 'q' to quit"
      self.new
    end
  end

  def self.play_game
    self.generate_evil_mastermind_code
    @@start_time = Time.now
    @@guesses = 0
    p "I have generated a secret sequence with four elements made up of:"
    p "(r)ed, (g)reen, (b)lue, and (y)ellow."
    p "Use (q)uit at any time to recognize my dominance, GIVE UP, and end the game."
    self.turn
  end

  def self.turn
    p "What's your guess?"
    guess = gets.chomp
    if guess == "q"
      self.evil_goodbye
    elsif guess == ""
      p ["What, too scared to guess?"].sample
      self.evil_help
    elsif self.invalid_guess?(guess)
      p ["Ha! '#{guess}' is not even the correct format!"]
      self.evil_help
    else
      self.compare_guess(guess)
    end
  end

  def self.compare_guess(guess)
    correct_color = 0
    correct_color_and_spot = 0
    guess_array = guess.split("")
    guess_array.each_with_index do |color, index|
      if color == @@secret_code[index]
        correct_color_and_spot +=1
  end

  def self.invalid_guess?(guess)
    guess.length != 4 #need to cover for invalid letters as well
  end

  def self.evil_help
    p ["I'll explain using small words so your puny mind can understand"].sample
    p ["Merely type out four letters, with 'r' standing for Red, 'b' for Blue, 'g' for Green, and 'y', for Yellow."].sample
    p ["Like this #{self.not_answer} (though that is not the answer, YOU THINK I WOULD BE FOOL ENOUGH TO GIVE YOU THE ANSWER LIKE THAT?!?)"].sample
    p ["And then just press the 'Enter' key, if you can manage. Ahahaha!"].sample
    self.turn
  end

  def self.not_answer
    not_the_answer = []
    4.times do
      not_the_answer << CODE_OPTIONS.sample
    end
    not_the_answer
  end

  def self.generate_evil_mastermind_code
    @@secret_code = []
    4.times do
      @@secret_code << CODE_OPTIONS.sample
    end
    @@reds = @@secret_code.select { |color| color == "r" }.count
    @@blues = @@secret_code.select { |color| color == "b" }.count
    @@greens = @@secret_code.select { |color| color == "g" }.count
    @@yellows = @@secret_code.select { |color| color == "y" }.count
  end

  def self.evil_goodbye
    p ["Until Next Time. Muahahahahaha!",
       "I win! I win! Hahaha! Foolish human! You lose!",
       "You will NEVER beat me! Aaahaahahaha!"].sample
  end

end


p "Welcome to MASTERMIND"
MasterMind.new
