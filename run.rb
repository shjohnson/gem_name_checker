require './lib/name_picker'

puts "What do you want to call your gem?"
name = gets.chomp
puts NamePicker.new(name).response
