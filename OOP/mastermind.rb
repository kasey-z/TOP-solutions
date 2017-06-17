class ComputerPlayer
   def initialize
     @human = HumanPlayer.new
     @game_board = GridsBoard.new
     @index = 12
   end

   def human_guess_game
     random_select
     @game_board.display_board
     12.times do
       @human.guess
       until @human.pick.all? {|a| $colors.include?(a)} && @human.pick.length == 4
         @human.guess
       end
       answer
       check_win?
       new_board
       @game_board.display_board
       if game_over?
         exclose
         @game_board.display_board
         if check_win?
           puts "You win!"
         else
           puts "Game over!"
         end
         break
       end
     end
   end

   private

   def random_select
     @secret_balls = $colors.sample(4)
   end

   def answer
     plus_qty = 0
     @secret_balls.each_with_index{ |ball, index| plus_qty += 1 if ball == @human.pick[index] }
     plus_qty
     minus_qty = (@human.pick & @secret_balls).length
     minus_qty = minus_qty - plus_qty
     space_qty = 4 - ( plus_qty + minus_qty )
     @minus_plus = "+"*plus_qty + "-"*minus_qty + " "*space_qty
   end

    def exclose
      @game_board.board_account[0]=@secret_balls
    end

    def new_board
      new_account = @human.pick.push @minus_plus
      @game_board.board_account[@index] = new_account
      @index -= 1
    end

    def check_win?
       if @minus_plus == "++++"
         true
       else
         false
       end
    end

    def game_over?
      if check_win? == true || @index < 1
        true
      else
        false
      end
    end
end

class GridsBoard
   attr_accessor :board_account

   $colors=["R","B","Y","P","G","T","D","A"]

   def initialize
     empty_arr = [" "," "," "," ","    "]
     enclosed_seceret = ["?","?","?","?","++++"]
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
      puts "color choices: \nR:red; B:blue; Y:yellow; P:purple; G:green; T:tea; D:Dark grey; A:aqua"
      puts "result: \n(+):both color and position are correct\n(-):only color is correct"
    end
end

class HumanPlayer
   attr_accessor :pick

   def initialize
      @pick = []
   end

   def guess
     puts "Pick 4 color balls at a time, don't put anything between the balls"
     @pick = gets.chomp.upcase.split('')
   end
end

computer = ComputerPlayer.new
computer.human_guess_game
