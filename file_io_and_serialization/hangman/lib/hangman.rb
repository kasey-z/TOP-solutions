class Hangman
  require 'yaml'

  def initialize
    @chance = 5
    @word = get_random_word
    @word_result = '_ ' * @word.length
    @correct = []
    @miss = []
  end

  def from_yaml
    file = YAML.load_file('save_data.yml')
    @chance = file[:chance]
    @word = file[:word]
    @miss = file[:miss]
    @correct = file[:correct]
    @word_result = file[:word_result]
  end

  def start_gaming
    display_result
    until game_end?
      ask_save
      human_guess
      compare
      display_result
    end
    puts win? ? "Congratulations! You win!" : "Out of guesses! You lose!"
    puts "The answer is #{@word.join.upcase}."
  end

  private

  def get_random_word
    words = File.readlines('5desk.txt')
    word = ''
    word = words[rand(words.length)].strip until (5..12).include?(word.length)
    word = word.split('')
  end

  def ask_save
     puts "Do you want to quit and save the game?"
     puts "If yes, input 'Y'. If not, press ENTER:"
     answer = gets.chomp.downcase
     if answer == 'y'
       save_game
       exit
     end
  end

  def save_game
    yaml_file = YAML.dump({
      word: @word,
      chance: @chance,
      word_result: @word_result,
      miss: @miss,
      correct: @correct
    })
    File.open('save_data.yml', 'w') { |f| f.write yaml_file }
  end

  def human_guess
    puts "Guess a letter from a to z:"
    @letter = gets.chomp.downcase
    until @letter.length == 1 && ('a'..'z').include?(@letter) && !(@miss + @correct).include?(@letter)
      puts "Invalid input or you already tried that character."
      @letter = gets.chomp.downcase
    end
    @letter
  end

  def compare
    if @word.join.downcase.include?(@letter)
      @correct.push @letter
      @word_result = get_word_result(@correct)
    else
      @miss.push @letter
      @chance -= 1
    end
  end

  def get_word_result(arr)
    result_arr = @word.collect{ |character| arr.include?(character.downcase) ? character : '_' }
    result_string = result_arr.join(' ')
  end

  def display_result
    system('cls')
    puts ''
    puts "Your guesses result:"
    puts ''
    puts "Word: #{ @word_result }"
    puts "Misses: #{ @miss.join(', ') }"
    puts "Chances left: #{ @chance }"
    puts ''
  end

  def game_end?
    ( @chance == 0 || win? ) ? true : false
  end

  def win?
    @word.join(' ') == @word_result ? true : false
  end

end


play_again = 'y'
while play_again == 'y'
  system('cls')
  puts ''
  puts "                          ~ Hangman ~"
  puts "Hangman is a guessing game between you and the computer."
  puts "The computer will thinks of a word with 5 to 12 characters."
  puts "In every turn you could make a guess of a letter."
  puts "You will have 5 chances for incorrect guesses."
  puts "For new game, press ENTER. Open saved game, input Y :"
  react = gets.chomp.downcase
  game = Hangman.new
  game.from_yaml if react == 'y'
  game.start_gaming
  puts "Do you want to play again? If yes, input Y. If no, press ENTER :"
  play_again = gets.chomp.downcase
end
