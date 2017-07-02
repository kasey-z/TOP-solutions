require '.\knight_moves.rb'

def knight_moves
  graph = Graphs.new
  result = graph.find_moves(start, target)
  puts "You made it in #{ result.size - 1 } moves!  Here's your path:"
  result.each { |arr| p arr }
end

knight_moves([3,3],[4,3])
