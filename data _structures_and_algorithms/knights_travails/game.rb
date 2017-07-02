require '.\knight_moves.rb'

def knight_moves
  system('cls')
  puts ''
  puts "                  ~ Knight's Travails ~"
  puts ''
  puts %{This is a simple 8X8 chess board game.
A knight in chess can move to any square
on the standard 8x8 chess board from any other square on the board,
given enough turns.
Its basic move is two steps forward and one step to the side.
It can face any direction.The board as having 2-dimensional coordinates.
From top to bottem : 0-7 ; From left to right : 0-7.
First you would input where you the knight to start.
For example 3,3. Next you would input where you want the knight to stop.
The computer will show the simplest possible way to get from the start to destination.
}

  graph = Graphs.new
  knight = Knight.new
  all_coordinates = graph.get_all_coordinates

  puts 'Input where you the knight to start:'
  a = gets.chomp.scan(/\w/)
  start = [a[0].to_i, a[1].to_i]
  until all_coordinates.include?(start)
    puts "Invalid input."
    a = gets.chomp.scan(/\w/)
    start = [a[0].to_i, a[1].to_i]
  end

  puts 'Input where you want the knight to stop:'
  b = gets.chomp.scan(/\w/)
  target = [b[0].to_i, b[1].to_i]
  until all_coordinates.include?(start)
    puts "Invalid input."
    b = gets.chomp.scan(/\w/)
    target = [b[0].to_i, b[1].to_i]
  end

  result = graph.find_moves(start, target)
  knight.start_square = start
  knight.target_square = target
  knight.moves << result
  puts "You made it in #{ result.size - 1 } moves!  Here's your path:"
  result.each { |arr| p arr }
end

knight_moves
