module ComputerGuess
class HumanPlayer
  attr_accessor :minus_plus

  def answer
    puts "Compare the four color balls on the screen."
    puts "Input your answer with +/- without space, for example: +-- :"
    reply = gets.chomp.strip
    while reply.length > 4 || (reply.split('') - ["+","-"]).length > 0
      reply = gets.chomp.strip
    end
    space_qty = 4 - reply.length
    @minus_plus = reply + " "*space_qty
  end
end

class ComputerPlayer
  attr_accessor :pick

  def initialize
    @pick = []
    @game_board = GridsBoard.new
    @human = HumanPlayer.new
    @index = 12
  end

  def computer_guess
    @game_board.display_board
    puts "pick 4 colors, write down on the paper so that you can easily compare."
    puts "when you are ready, please input OK:"
    ready = gets.chomp.downcase
    until ready == "ok"
      puts "Invalid input. Please try again:"
      ready = gets.chomp.downcase
    end
    random_guess
    game_move
    if game_over?
      p_result
      exit
    end
    11.times do
      guess2
      game_move
      if game_over?
        p_result
        break
      end
    end
  end

  def p_result
    puts  check_win? ? "The computer wins!" : "Game over!"
  end

  def game_move
    computer_board
    @game_board.display_board
    @human.answer
    human_board
    @game_board.display_board
    check_win?
  end

  def random_guess
    @pick= $colors.sample(1) + $colors.sample(1) + $colors.sample(1) + $colors.sample(1)
  end

  def guess2
    minor_qty = @human.minus_plus.scan("-").length
    plus_qty = @human.minus_plus.scan("+").length
    color_cr_qty = minor_qty + plus_qty
    all_cr_qty=plus_qty
    case color_cr_qty
    when  0
      $colors = $colors - @pick
      random_guess
    when  4
      @pick= @pick.sample(4)
    when  3
      @pick= (@pick.sample(3) + $colors.sample(1)).sample(4)
    when 2
      @pick= (@pick.sample(2) + $colors.sample(2)).sample(4)
    when  1
      @pick= (@pick.sample(1) + $colors.sample(3)).sample(4)
    end
  end


  def computer_board
    new_account = @pick
    new_account += ["    "]
    @game_board.board_account[@index] = new_account
  end

  def human_board
     new_account = @pick + [@human.minus_plus]
     @game_board.board_account[@index] = new_account
     @index -= 1
  end

  def check_win?
    @human.minus_plus == "++++" ? true : false

  end

  def game_over?
    (check_win? == true || @index < 1) ? true : false
end

class GridsBoard
   attr_accessor :board_account

   $colors=["R","B","Y","P","G","T"]

   def initialize
     empty_arr = [" "," "," "," ","    "]
     enclosed_seceret = ["?","?","?","?","    "]
     @board_account = []
     12.times { @board_account.push empty_arr }
     @board_account.unshift enclosed_seceret
   end

    def display_board
      line = "\n-------------------------\n"
      y = ""
      @board_account.each do |arr|
        arr.each { |string| y += "| #{ string } |" }
        y += line
      end
      board = line + y + "    1    2    3    4   result:"
      system("cls")
      puts board.lines.map { |line| line.strip.center(50) }
      puts "color choices: \nR:red; B:blue; Y:yellow; P:purple; G:green; T:tea"
      puts "result: \n(+):both color and position are correct\n(-):only color is correct"
    end
end

end
