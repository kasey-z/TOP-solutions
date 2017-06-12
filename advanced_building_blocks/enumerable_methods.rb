module Enumerable
  def my_each
    i=0
    while i < self.length
      yield(self[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    i=0
    while i < self.length
      yield self[i], i
      i += 1
    end
    self
  end

  def my_select
    new_arr=[]
    self.my_each do |a|
      if (yield a)
         new_arr.push a
      end
    end
    new_arr
  end

  def my_all?
    pass_element=0
    self.my_each do |a|
      if (yield a)
        pass_element += 1
      end
    end
    if pass_element == self.length
       return true
    else
       return false
    end
  end

  def my_any?
    result=false
    self.my_each do |a|
      if (yield a)
        result=true
        break
      end
    end
    return result
  end

  def my_none?
    result=true
    self.my_each do |a|
      if (yield a)
        result=false
        break
      end
    end
    return result
  end

  def my_count
    count=0
    self.my_each do |a|
      if (yield a)
        count += 1
      end
    end
    return count
  end

  def my_map
    new_arr=[]
    self.my_each do |a|
      new_element= (yield a)
      new_arr.push new_element
    end
    return new_arr
  end

  def my_inject(num=nil)
      if num.nil?
         result=self[0]
         for index in (1...self.length)
           result=(yield result, self[index])
         end
         return result
      else
         result=num
         self.my_each do |a|
            result=(yield result, a)
         end
         return result
      end

  end

  def my_map_proc (&code_block)
    new_arr=[]
    self.my_each do |a|
      new_element= (code_block.call a)
      new_arr.push new_element
    end
    return new_arr
  end

  def my_map_proc_block (&code_block)
    new_arr=[]
    self.my_each do |a|
      unless code_block.nil?
        new_element= (code_block.call a)
      else
        new_element= (yield a)
      end
        new_arr.push new_element
    end
    return new_arr
  end
end

def multiply_els(arr)  ##raise error
  arr.my_inject {|a,b| a*b}
end
