def stock_picker(array=[17,3,6,9,15,8,6,1,10])
  buyDay=0
  daysAndProfits={}
  array.each do |price|
     saleDay=buyDay+1
      while saleDay <= array.length-1
        profit= array[saleDay]-price
        daysAndProfits["#{buyDay}, #{saleDay}"]=profit
        saleDay += 1
      end
      buyDay=buyDay+1
    end
    daysAndProfits = daysAndProfits.sort_by {|a,b| b}  #here daysAndProfits becomes an array
    daysAndProfits.reverse!
    bestDays=daysAndProfits[0]
    bestDays=bestDays[0]
    puts "the best buy and sell day is #{bestDays}"

end

stock_picker()
