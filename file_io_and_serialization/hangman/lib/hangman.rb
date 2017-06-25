class Hangman
  def initialize
    @chance = 5
    @word = get_random_word
    @human = Human.new
    @word_result = '_ ' * @word.length
  end

  def start_gaming
    display_result
    until game_end?
      human_guess
      compare
      display_result
    end

    if win?
      puts "Congratulations! You win!"
    else
      puts "Out of guesses! You lose!"
    end
    puts "The answer is #{@word.join.upcase}."
  end

  private

  def get_random_word
    words = File.readlines('5desk.txt')
    word = String.new
    until (5..6).include?(word.length)
      word = words[rand(words.length)].strip
    end
    word = word.split('')
  end

  def human_guess
    puts "Guess a letter from a to z:"
    @letter = gets.chomp.downcase
    until @letter.length == 1 && ('a'..'z').include?(@letter)
      puts "Invalid input."
      @letter = gets.chomp.downcase
    end
    @letter
  end

  def compare
    if @word.join.downcase.include?(@letter)
      @human.correct.push @letter
      @word_result = get_word_result(@human.correct)
    else
      @human.miss.push @letter
      @chance -= 1
    end
  end

  def get_word_result(arr)
    result_arr = @word.collect do |character|
      if arr.include?(character.downcase)
        character
      else
        '_'
      end
    end
    result_arr = result_arr.join(' ')
  end

  def display_result
    puts "Word: #{ @word_result }"
    puts "Misses: #{ @human.miss.join(', ') }"
    puts "Chances left: #{ @chance }"
  end

  def game_end?
    if @chance == 0 || win?
      true
    else
      false
    end
  end

  def win?
    if @word.join(' ') == @word_result
      true
    else
      false
    end
  end

end

class Human
  attr_accessor :correct, :miss

  def initialize
    @correct = []
    @miss = []
  end
end


system('cls')
puts ''
puts "                          ~ Hangman ~"
puts "Hangman is a guessing game between you and the computer."
puts "The computer will thinks of a word with 5 to 12 characters."
puts "In every turn you could make a guess of a letter."
puts "You will have 5 chances for incorrect guesses."
puts "Press enter if you are ready :"
react = gets.chomp
game = Hangman.new
game.start_gaming
