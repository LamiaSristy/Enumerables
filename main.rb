require_relative 'lib/enumerable.rb'

puts '1.--------my_each--------'
%w[Sharon Leo Leila Brian Arun].my_each { |friend| puts friend }

puts '2.--------my_each_with_index--------'
%w[Sharon Leo Leila Brian Arun].my_each_with_index { |friend, index| puts friend if index.even? }

puts '3.--------my_select--------'
arr = (%w[Sharon Leo Leila Brian Arun].my_select { |friend| friend != 'Brian' })
puts arr

puts '4.--------my_all--------'
(%w[ant bear cat].my_all? { |word| word.length >= 3 }) #=> true
(%w[ant bear cat].my_all? { |word| word.length >= 4 }) #=> false
%w[ant bear cat].my_all?(/t/) #=> false
[1, 2i, 3.14].my_all?(Numeric) #=> true
[].my_all? #=> true

puts '5.--------my_any--------'
(%w[ant bear cat].my_any? { |word| word.length >= 3 }) #=> true
(%w[ant bear cat].my_any? { |word| word.length >= 4 }) #=> true
%w[ant bear cat].my_any?(/d/) #=> false
[nil, true, 99].my_any?(Integer) #=> true
[nil, true, 99].my_any? #=> true
[].my_any? #=> false

puts '6.--------my_none--------'
(%w[ant bear cat].my_none? { |word| word.length == 5 }) #=> true
(%w[ant bear cat].my_none? { |word| word.length >= 4 }) #=> false
%w[ant bear cat].my_none?(/d/) #=> true
[1, 3.14, 42].my_none?(Float) #=> false
[].my_none? #=> true
[nil].my_none? #=> true
[nil, false].my_none? #=> true
[nil, false, true].my_none? #=> false

puts '7.--------my_count--------'
arr = [1, 2, 4, 2]
arr.my_count #=> 4
arr.my_count(2) #=> 2
(arr.my_count { |x| (x % 2).zero? }) #=> 3

puts '8.--------my_maps--------'
my_order = ['medium Big Mac', 'medium fries', 'medium milkshake']
(my_order.my_map { |item| item.gsub('medium', 'extra large') })
((0..5).my_map { |i| i * i })
puts 'my_map_proc'
my_proc = proc { |i| i * i }
(1..5).my_map(my_proc) { |i| i + i }

puts '8.--------my_inject--------'
((1..5).my_inject { |sum, n| sum + n }) #=> 15
(1..5).my_inject(1) { |product, n| product * n } #=> 120
longest = %w[ant bear cat].my_inject do |memo, word|
  memo.length > word.length ? memo : word
end
puts longest #=> "bear"

puts 'multiply_els'
def multiply_els(arr)
  arr.my_inject(1, '*')
end
multiply_els([2, 4, 5]) #=> 40
