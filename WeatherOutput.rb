require './Weather.rb'

def ask_zip
  puts "Enter a Zip Code to get its weather"
  Weather.new(zip_code: gets.chomp).summary
  puts ""
  puts "Is there another area you would like to know the weather for? (Y/N)"

  if gets.chomp.downcase == "y"
    return true
  else
    return false
  end
end

while ask_zip
  ask_zip
end
