def fibs(n)
    return [0] if n == 0
    return [0,1] if n == 1
    fibs_arr = [0,1]
    i=2
    while i <= n
      fibs_arr << ( fibs_arr[i-1] + fibs_arr[i-2] )
      i += 1
    end
    fibs_arr
end

def fibs_rec(n)
  return [0] if n ==0
  return [0,1] if n == 1
  fibs_rec(n-1) << fibs_rec(n-1)[-1] + fibs_rec(n-1)[-2]
end

p fibs(10)
p fibs_rec(10)
