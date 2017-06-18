#-Tic Tac Toe game
#This game is played on the command line between two players.
#The first player can choose to play X or O.

class TicTacToe

  def initialize(first_player, second_player)
     @first_player = first_player
     @second_player = second_player
     @current_player = @first_player
     @played_grids = 0
     @board_num = [["1","2","3"],["4","5","6"],["7","8","9"]]
     @someone_win = false
  end

  def playing
    display_board
    while @played_grids < 9
      game_move(@current_player)
      win?(@current_player)
      break if @someone_win == true
      shift_player
    end
    puts "You are tie" if @someone_win==false
    puts "The game is over."
  end

  private

  def game_move(player)
    puts "Hey, #{ player.name } player, which number you want to take?
      \nInput the numbers on the board:"
    move=gets.chomp
    until @board_num.flatten.include?(move)
      puts "Oops, you did not input 1 to 9, or your number is already taken."
      move = gets.chomp
    end
    took_number(move, player)
  end

  def took_number(num,player)
    @board_num.map! do |arr|
      arr.map! { |m| m==num ? player.name : m }
    end
    @played_grids += 1
    display_board
    player.grids.push  num.to_i
  end

  def display_board
    system("cls")
    line = "\n--------------\n"
    y = ""
    @board_num.each do |arr|
      arr.each { |string| y += "| #{ string } |" }
      y += line
    end
    board = "\nTic Tac Toe:" + line + y
    puts board.lines.map { |line| line.strip.center(50) }
  end

  def shift_player
    @current_player =
      @current_player == @first_player ? @second_player : @first_player
  end

  def win?(player)
    win_arr= [[1,5,9],[3,5,7],[1,4,7],[2,5,8],[3,6,9],[1,2,3],[4,5,6],[7,8,9]]
    if win_arr.any? {|arr| (arr - player.grids).empty?}
      puts "#{ player.name }'s player, you win the game!"
      @someone_win = true
    end
  end
end

class Players
  attr_accessor :name, :grids

  def initialize(name)
    @name = name
    @grids = []
  end
end

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
  game.playing
end

run_the_game
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
   exit
end
