require_relative 'lib/enumerable.rb'

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

puts '1.--------my_each--------'
friends.my_each { |friend| puts friend }

puts '2.--------my_each_with_index--------'
friends.my_each_with_index { |friend, index| puts friend if index.even? }

puts '3.--------my_select--------'
puts friends.my_select { |friend| friend != 'Brian' }
