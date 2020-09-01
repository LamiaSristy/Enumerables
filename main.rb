require_relative 'lib/enumerable.rb'

# friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

# puts '1.--------my_each--------'
# friends.my_each { |friend| puts friend }

# puts '2.--------my_each_with_index--------'
# friends.my_each_with_index { |friend, index| puts friend if index.even? }

# puts '3.--------my_select--------'
# puts friends.my_select { |friend| friend != 'Brian' }

puts '4.--------my_all--------'
# puts %w[ant bear cat].my_all? { |word| word.length >= 3 }
# puts %w[ant bear cat].my_all? { |word| word.length >= 4 }
# puts %w[ant bear cat].my_all?(/t/)
# puts [1, 2i, 3.14].my_all?(Numeric)
# puts [].my_all?

puts '5.--------my_any--------'
# puts %w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
# puts %w[ant bear cat].my_any? { |word| word.length >= 4 } #=> true
# puts %w[ant bear cat].my_any?(/d/)                        #=> false
# puts [nil, true, 99].my_any?(Integer)                     #=> true
# puts [nil, true, 99].my_any?                              #=> true
# puts [].my_any?                                           #=> false

puts '6.--------my_none--------'
# puts %w{ant bear cat}.my_none? { |word| word.length == 5 } #=> true
# puts %w{ant bear cat}.my_none? { |word| word.length >= 4 } #=> false
# puts %w{ant bear cat}.my_none?(/d/)                        #=> true
# puts [1, 3.14, 42].my_none?(Float)                         #=> false
# puts [].my_none?                                           #=> true
# puts [nil].my_none?                                        #=> true
# puts [nil, false].my_none?                                 #=> true
# puts [nil, false, true].my_none?                           #=> false

puts '7.--------my_count--------'
# arr = [1, 2, 4, 2]
# puts arr.my_count
# puts arr.my_count(2)
# puts arr.my_count { |x| x%2 == 0 }

puts '8.--------my_count--------'
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
puts friends.my_map { |friend| friend.upcase }
