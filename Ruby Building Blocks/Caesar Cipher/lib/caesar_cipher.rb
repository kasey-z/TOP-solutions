#ASCII
#a-z: 97-122
#A-Z: 65-90
def caesar_cipher(string, num)
  newstring = ''
  string.scan(/./) do |x|
    asc = x.ord
    if (97..122).include?(asc)
      asc > 122 - num ? asc = 96 + (num - (122 - asc)) : asc += num
    elsif (65..90).include?(asc)
      asc > 90 - num ?  asc = 64 + (num - (90 - asc)) : asc += num
    else
      asc
    end
    new_character = asc.chr
    newstring = newstring + new_character
  end
  newstring
end

caesar_cipher("What a string!", 5)
