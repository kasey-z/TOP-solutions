#this will only work on two sorted or single-element arrays. return with an sorted array
def merge_two_sorted_array (arr_b, arr_c, result = [])
  until arr_b.empty? || arr_c.empty?
    arr_b[0] <= arr_c[0] ? result << arr_b.shift : result << arr_c.shift
  end
  result += (arr_b.length== 0) ? arr_c : arr_b
end

def merge_sort(arr)
  arr.flatten!
#the arr will be slide until it has only one element
  if arr.length < 2
    arr
  else
#the slided arrays start to merge only until they all got only one element.
    arr_b = merge_sort(arr.slice!(0,arr.length/2))
    arr_c = merge_sort(arr)
    merge_two_sorted_array(arr_b, arr_c)
  end
end

unsorted = []
20.times { unsorted << rand(99) }
p merge_sort(unsorted)
