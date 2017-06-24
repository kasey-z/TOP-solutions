require 'CSV'
require 'sunlight/congress'
require 'erb'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,'0')[0..4]
end

def legislators_by_zipcode(zipcode)
  legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def clean_phone_number (phone_number)
  if phone_number.length == 10 || (phone_number.length == 11 && phone_number[0] == '1')
    phone_number = phone_number.rjust(11,'0')[1..10]
    phone_string = "#{phone_number[0..2]}-#{phone_number[3..5]}-#{phone_number[6..9]}"
  else
    phone_string = 'invalid'
  end
end

def save_thank_you_letters(id, form_letter)
  Dir.mkdir('output') unless Dir.exists? 'output'

  filename = "output/thanks_#{id}.html"

  File.open(filename,'w') do |file|
    file.puts form_letter
  end
end

puts %Q{EventManager Initialized!}

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  phone_number = clean_phone_number(row[:homephone].scan(/[0-9]/).join)

  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  save_thank_you_letters(id,form_letter)

end
