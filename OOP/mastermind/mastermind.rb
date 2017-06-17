puts "This is the mastermind game. Please choose 1 or 2:"
puts "1: the guess\n2: the creator of the secret code "
game_style = gets.chomp
until game_style == "1" || game_style == "2"
  "incorrect answer"
  game_style = gets.chomp
end
if game_style == "1"
  require_relative 'human'
  require_relative 'board'
  computer = HumanGuess::ComputerPlayer.new
  computer.human_guess_game
elsif game_style == "2"
  require_relative 'computer'
  game = ComputerGuess::ComputerPlayer.new
  game.computer_guess
end
