dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(string="below",dictionary)
  matchings=Hash.new(0)
    string=string.downcase
    strings=string.split(/\W\W?/)
    strings.each do |each_word|
      dictionary.each do |vacabulary|
        if each_word.include?(vacabulary)
          matchings[vacabulary] += 1
        end
      end
    end
  puts matchings


end

substrings("Howdy partner, sit down! How's it going?", dictionary)
