require './lib/enumerable.rb'

RSpec.describe 'my enumerable methods' do
  let(:my_array) { %w[Sharon Leo Leila Brian Arun] }
  let(:my_range) { (5..10) }
  let(:my_hash) { { a: 'abs', b: 'cdr' } }
  let(:num_array) { [1, 2, 3, 4, 5] }
  let(:my_order) { ['medium Big Mac', 'medium fries', 'medium milkshake'] }

  context 'test my_each' do
    it 'should return enumerator object if block is not given' do
      expect(my_array.my_each.instance_of?(Enumerator)).to be(true)
    end

    it 'should return each array items' do
      expect(my_array.my_each { |el| el }).to eq(my_array.each { |el| el })
    end

    it 'should return each item from a given range' do
      expect(my_range.my_each { |el| el }).to eq(my_range.each { |el| el })
    end

    it 'should return each item key a given hash-rage' do
      expect(my_hash.my_each { |key, _value| key }).to eq(my_hash.each { |key, _value| key })
    end
  end

  context 'test my_each_with_index' do
    it 'should return enumerator object if block is not given' do
      expect(my_array.my_each_with_index.instance_of?(Enumerator)).to be(true)
    end

    it 'should return every even element' do
      expect(my_array.my_each_with_index { |el, index| el if index.even? }).to eql(my_array.each_with_index { |el, index| el if index.even? })
    end

    it 'should return every even element' do
      expect(my_array.my_each_with_index { |el, index| el if index % 3 == 0 }).to eql(my_array.each_with_index { |el, index| el if index % 3 == 0 })
    end

    it 'should return each item from a given range' do
      expect(my_range.my_each_with_index { |el| el }).to eq(my_range.each { |el| el })
    end

    it 'should return each item key a given hash-rage' do
      expect(my_hash.my_each_with_index { |key, _value| key }).to eq(my_hash.each_with_index { |key, _value| key })
    end
  end

  context 'test my_select' do
    it 'should return enumerator object if block is not given' do
      expect(my_array.my_select.instance_of?(Enumerator)).to be(true)
    end

    it 'should return every element except the selected element' do
      expect(my_array.my_select { |el| el != 'Brian' }).to eql(my_array.select { |el| el != 'Brian' })
    end

    it 'should return every selected element' do
      expect(my_array.my_select { |el| el == 'Brian' }).to eql(my_array.select { |el| el == 'Brian' })
    end

    it 'should return element from range' do
      expect(my_range.my_select { |el| el == 5 }).to eql(my_range.select { |el| el == 5 })
    end

    it 'should return every element except the selected element' do
      expect(my_range.my_select { |el| el != 5 }).to eql(my_range.select { |el| el != 5 })
    end

    it 'should select the key which is equal to blocks condition' do
      expect(my_hash.my_select { |key, _value| key == :a }).to eql({ a: 'abs' })
    end
  end

  context 'test my_all' do
    it 'should return true if there is no block and array is empty' do
      expect([].my_all?).to eq(true)
    end

    it 'should return true if every item is numeric' do
      expect([1, 2i, 3.14].my_all?(Numeric)).to eq(true)
    end

    it 'should check if regex is consists in every element and return false' do
      expect(%w[ant bear cat].my_all?(/t/)).to eq(false)
    end

    it 'should check if regex is consists in every element and return true' do
      expect(%w[ant bat cat].my_all?(/t/)).to eq(true)
    end

    it 'should check if every element length is equal 3' do
      expect(%w[ant bat cat].my_all? { |word| word.length == 3 }).to eq(true)
    end

    it 'should check if every element length is greater than 3' do
      expect(my_array.my_all? { |word| word.length > 3 }).to eq(false)
    end

    it 'should check if every element inside range is positive' do
      expect(my_range.my_all? { |el| el.positive? }).to eq(true)
    end

    it 'should check if every element inside range is negative' do
      expect((-3..-90).my_all? { |el| el.negative? }).to eq(true)
    end
  end

  context 'test my_any' do
    it 'should return false if there is no block and array is empty' do
      expect([].any?).to eq(false)
    end

    it 'should return true if any of items is numeric' do
      expect([1, 'f', 3.14].my_any?(Numeric)).to eq(true)
    end

    it 'should check if regex is consists in every element and return false' do
      expect(%w[ant bear cat].my_any?(/t/)).to eq(true)
    end

    it 'should check if regex is consists in any element and return false' do
      expect(%w[ant bat cat].my_any?(/l/)).to eq(false)
    end

    it 'should check if any element length is equal 4' do
      expect(%w[lion bat cat].my_any? { |word| word.length == 4 }).to eq(true)
    end

    it 'should check if any element length is greater than 3' do
      expect(%w[ant bat cat].my_any? { |word| word.length > 3 }).to eq(false)
    end

    it 'should check if any element inside range is positive' do
      expect((-3..8).my_any? { |el| el.positive? }).to eq(true)
    end

    it 'should check if any element inside range is negative' do
      expect(my_range.my_any? { |el| el.negative? }).to eq(false)
    end
  end

  context 'test my_none' do
    it 'should return true if none of the element has length of 5' do
      expect(%w[ant bear cat].my_none? { |word| word.length == 5 }).to be true
    end

    it 'should return false if none of the element has length of greater than 4' do
      expect(%w[ant bear cat].my_none? { |word| word.length >= 4 }).to be false
    end

    it 'should return true if none of the element is Regex /d/' do
      expect(%w[ant bear cat].my_none?(/d/)).to be true
    end

    it 'should return false if none of the element is Floatx /d/' do
      expect([1, 3.14, 42].my_none?(Float)).to be false
    end

    it 'should return true if its an empty array' do
      expect([].my_none?).to be true
    end

    it 'should return true if its an array with falsy elements ' do
      expect([nil, false].my_none?).to be true
    end
  end

  context 'test my_count' do
    it 'should return 0 if there is an empty array and no block given' do
      expect([].my_count).to eq(0)
    end

    it 'should return the length of the array which is 5' do
      expect(num_array.my_count).to eql(num_array.length)
    end

    it 'should return the frequency of given number inside array' do
      expect(num_array.my_count(2)).to eql(1)
    end

    it 'should return the frequency numbers inside array which are divisible with a given number' do
      expect(num_array.my_count { |x| (x % 2).zero? }).to eql(2)
    end

    it 'should return the frequency numbers inside array which are divisible with a given number' do
      expect((-3..8).my_count { |x| x.positive? }).to eql(8)
    end
  end

  context 'test my_map' do
    it 'should return the array with changed medium to extra_large' do
      expect(my_order.my_map { |x| x.gsub('medium', 'extra large') }).to eql(['extra large Big Mac', 'extra large fries', 'extra large milkshake'])
    end

    it 'should return the array with squared element of each element' do
      expect(my_range.my_map { |i| i * i }).to eq([25, 36, 49, 64, 81, 100])
    end

    it 'should return the array with squared element of each element' do
      my_proc = proc { |x| x + 2 }
      expect(my_range.my_map(my_proc)).to eq([7, 8, 9, 10, 11, 12])
    end
  end

  context 'test my_inject' do
    it 'should return the sum of all the elements' do
      expect(my_range.my_inject { |sum, n| sum + n }).to eq(45)
    end

    it 'should return the multiplication of all the elements startting with the given number' do
      expect((1..5).my_inject(1) { |product, n| product * n }).to eq(120)
    end

    it 'should return one string by concating array elements' do
      expect(['I ', 'love ', 'ice water'].my_inject { |acc, cur| acc + cur }).to eq('I love ice water')
    end
  end

  context 'test multiply_els' do
    it 'should return the multiplication of all the elements' do
      expect(multiply_els([2, 4, 5])).to eq(40)
    end
  end

  it "hope TSE's will approve our project from first try, dont disappoint us" do
    expect('of course they will approve').to eq('of course they will approve')
  end
end
