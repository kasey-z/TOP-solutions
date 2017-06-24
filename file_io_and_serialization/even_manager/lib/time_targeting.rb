# Find out which hours of the day the most people registered
require 'CSV'
require 'date'

def sort_by_value_desc (hash)
  hash.sort_by {|k,v| v}.reverse
end

contents = CSV.open 'full_event_attendees.csv', headers: true, encoding:'utf-8'

hours_hash = Hash.new(0)
week_hash = Hash.new(0)
contents.each do |row|
  data_object = DateTime.strptime(row[1],'%m/%d/%Y %H:%M')
  hours_hash[data_object.hour] += 1
  week_hash[data_object.wday] += 1
end
sorted_hour = sort_by_value_desc(hours_hash)
sorted_day = sort_by_value_desc(week_hash)
week = {'0':'Sunday','1':'Monday','2':'Tuesday','3':'Wednesday','4':'Thursday', '5':'Friday', '6':'Saturday'}
weekday = (sorted_day[0][0]).to_s.to_sym

puts "The peak registration hours are #{sorted_hour[0][0]}, #{sorted_hour[1][0]}, #{sorted_hour[2][0]}."
puts "Most people registered on #{week[weekday]}"
