class TicTacToe

  def initialize(first_player, second_player)
     @first_player = first_player
     @second_player = second_player
     @current = @first_player
     @board_num = [["1","2","3"],["4","5","6"],["7","8","9"]]
  end

  def playing
    string = "The game is over.\n"
    display_board
    9.times do
      number = take_number(@current.name)
      number_to_name(number, @current.name)
      number_to_grids(number, @current.grids)
      display_board
      break if win?(@current)
      shift_player
    end
    string += win?(@current) ? "#{@current.name}'s player, you win! Congratulations!'" : "You are tie!"
  end

  private

  def take_number(name)
    puts "Hey, #{ name } player, which number you want to take?
      \nInput the numbers on the board:"
    number = gets.chomp
    until @board_num.flatten.include?(number)
      puts "Oops, you did not input 1 to 9, or your number is already taken."
      number = gets.chomp
    end
    number
  end

  def number_to_name(number, name)
    @board_num.map! do |arr|
      arr.map! { |m| m == number ? name : m }
    end
  end

  def number_to_grids(number, arr)
    arr << number
  end

  def display_board
    system("cls")
    line = "\n--------------\n"
    board = ''
    @board_num.each do |arr|
      board = arr.inject(board) { |result, string| result + "| #{ string } |" } + line
    end
    board = "\nTic Tac Toe:" + line + board
    puts board.lines.map { |line| line.strip.center(50) }
  end

  def shift_player
    @current =
      @current == @first_player ? @second_player : @first_player
  end

  def win?(player)
    win_arr = [%w{1 5 9}, %w{3 5 7}, %w{1 4 7}, %w{2 5 8}, %w{3 6 9}, %w{1 2 3}, %w{4 5 6}, %w{7 8 9}]
    (win_arr.any? {|arr| (arr - player.grids).empty?}) ? player : false
  end
end

class Players
  attr_accessor :name, :grids

  def initialize(name)
    @name = name
    @grids = []
  end
end
