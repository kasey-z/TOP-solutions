require ".\\tic_tac_toe"
def run_the_game
  system("cls")
  puts "                        Tic Tac Toe"
  puts "This game is played by two players."
  puts "The first player can choose to play X or O. \nInput X or O:"
  player1 = gets.chomp.upcase
  while player1.downcase != "x" && player1.downcase != "o"
    puts "Ops, incorrect input. Please input x or o:"
    player1 = gets.chomp.upcase
  end
  puts "First player, you chose to play #{ player1 }"
  player2 = player1.downcase == "x"? "O" : "X"
  puts "Well, the second player, you play #{ player2 }"
  first_player = Players.new(player1)
  second_player = Players.new(player2)
  game = TicTacToe.new(first_player, second_player)
  puts game.playing
end


def play_again
  want_to_play = true
  while want_to_play
    puts "Do you want to play the game again?\nInput Yes or No:"
    reply = gets.chomp.downcase
    until reply == "yes" || reply == "no"
      puts "wrong input, please input again."
      reply = gets.chomp.downcase
    end
    case reply
    when "yes"
      run_the_game
    when "no"
      want_to_play = false
      exit
    end
  end
end

run_the_game
play_again
