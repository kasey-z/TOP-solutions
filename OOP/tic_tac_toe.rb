
class TicTacToe

  def initialize(first_player, second_player)
     @first_player = first_player
     @second_player = second_player
     @current_player = @first_player
     @played_grids = 0
     @board_num = [["1","2","3"],["4","5","6"],["7","8","9"]]
     @someone_win = false
     @taken_num = []
  end

  def playing
    display_board
    while @played_grids < 10
      game_move(@current_player)
      win?(@current_player.grids, @current_player.name)
      break if @someone_win==true or @played_grids >9
      shift_player
    end
    puts "you are even" if  @someone_win==false
    puts "the game is over"
  end

  private

  def game_move(player)
    puts "Hey, #{ player.name } player, which number you want to take?
      \nPlease input the numbers on the board."
    move=gets.chomp.to_i
    while (1..9).include?(move) ==false || @taken_num.include?(move)==true
      puts "you did not input 1 to 9, or your number is already taken."
      puts "please check the board and input again"
      move = gets.chomp.to_i
    end
    took_number(move, player.grids, player.name)
  end

  def took_number(num,arr,name)
    arr.push num
    @taken_num.push num
    num = num.to_s
    @board_num.map! do |arr|
      arr.map! { |m| m==num ? name : m }
    end
    @played_grids += 1
    display_board
  end

  def display_board
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


  def win?(player_arr, player)
    win_ar r= [[1,5,9],[3,5,7],[1,4,7],[2,5,8],
              [3,6,9],[1,2,3],[4,5,6],[7,8,9]]
    if win_arr.any? {|arr| (arr - player_arr).empty?}
      puts "#{ player }'s player, you win the game!"
      @someone_win=true
      return true
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
  puts "Welcome to the Tic Tac Toe game."
  puts "You are the first player, you want to play X or O?"
  puts "Please input X or O"
  player1 = gets.chomp.upcase
  while player1.downcase != "x" && player1.downcase != "o"
    puts "Ops, incorrect input. Please input x or o"
    player1 = gets.chomp.upcase
  end
  puts "first player, you chose to play #{ player1 }"
  player2 = player1.downcase == "x"? "O" : "X"
  puts "Well, the second player, you play #{ player2 }"
  first_player = Players.new(player1)
  second_player = Players.new(player2)
  game = TicTacToe.new(first_player, second_player)
  game.playing
end

run_the_game
puts "do you want to play the game again? Yes or No"
reply = gets.chomp.downcase
until reply == "yes" || reply == "no"
   puts "wrong input, please input again"
end
case reply
when "yes"
  run_the_game
when "no"
   exit
end
