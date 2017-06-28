require './linked_lists.rb'
#--------------test-------------------------
list = LinkedList.new
i = 0
while i < 6
  list.append(i)
  i += 1
end

puts list
#=> ( 0 ) -> ( 1 ) -> ( 2 ) -> ( 3 ) -> ( 4 ) -> ( 5 ) -> nil

list.prepend(10)
puts list
#=> ( 10 ) -> ( 0 ) -> ( 1 ) -> ( 2 ) -> ( 3 ) -> ( 4 ) -> ( 5 ) -> nil

puts list.size
#=> 7

puts list.head
#=> 10

puts list.tail
#=> 5

puts list.at(5)
#=> 4

puts list.pop
#=> 5
puts list
#=> ( 10 ) -> ( 0 ) -> ( 1 ) -> ( 2 ) -> ( 3 ) -> ( 4 ) -> nil

puts list.contains?(4)
#=> true
puts list.contains?(11)
#=> false
puts list.find(4)
#=> 5

list.insert_at(2, 100)
puts list
#=> ( 10 ) -> ( 0 ) -> ( 100 ) -> ( 1 ) -> ( 2 ) -> ( 3 ) -> ( 4 ) -> nil

list.remove_at(2)
puts list
#=> ( 10 ) -> ( 0 ) -> ( 1 ) -> ( 2 ) -> ( 3 ) -> ( 4 ) -> nil

list.remove_at(0)
puts list
#=> ( 0 ) -> ( 1 ) -> ( 2 ) -> ( 3 ) -> ( 4 ) -> nil
