def bubble_sort (arr)
  i = 0
  (arr.length-1).times do
      x=0
      y=1
      while y < (arr.length-i)
        if arr[x] > arr[y]
          bigger=arr[x]
          arr[x]=arr[y]
          arr[y]=bigger
        end
        x += 1
        y = x+1
      end
      i += 1
   end
   puts "the bubble_sort method result is"
   p arr
end
bubble_sort([4,3,78,2,0,2])

#---------------------------------------------------------------------------

def bubble_sort_by (arr)
  i = 0
  (arr.length-1).times do
      x = 0
      y = 1
      while y < (arr.length - i)
        if (yield arr[x], arr[y]) > 0
          bigger=arr[x]
          arr[x]=arr[y]
          arr[y]=bigger
        end
        x += 1
        y = x + 1
      end
      i += 1  #after each round, one of number in the right side in fixed. won't count this number in next round
   end
   puts "the bubble_sort_by method result is"
   p arr
end

bubble_sort_by (["hi","hello","hey"]) do |left, right|
     left.length - right.length
end
