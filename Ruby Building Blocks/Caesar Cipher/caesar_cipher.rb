#ASCII
#a-z: 97-122
#A-Z: 65-90

def caesar_cipher(string="What a string!",num=5)
  newstring=''
  string.scan(/./) do |x|
    asc=x.ord
    if (97..122).include?(asc)
       if asc>122-num
         asc=96+(num-(122-asc))
       else
           asc += num
       end
     elsif (65..90).include?(asc)
       if asc>90-num
         asc=64+(num-(90-asc))
       else
           asc += num
       end
     else
        asc=asc
     end
    new_character=asc.chr
    newstring=newstring + new_character
    end
    puts newstring
end

caesar_cipher()
