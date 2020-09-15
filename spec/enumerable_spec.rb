require './lib/enumerable.rb'

RSpec.describe 'my enumerable methods' do
  let(:my_array) { %w[Sharon Leo Leila Brian Arun] }
  let(:my_range) { (5..10) }
  let(:my_hash) { { a: 'abs', b: 'cdr' } }
  let(:num_array) { [1, 2, 3, 4, 5] }

  context 'test my_each' do
    # it 'should return enumerator object if block is not given' do
    #   expect(my_array.my_each.instance_of?(Enumerator)).to be(true)
    # end

    # it 'should return each array items' do
    #   expect(my_array.my_each {|el| el}).to eq(my_array.each {|el| el})
    # end

    # it 'should return each item from a given range' do
    #   expect(my_range.my_each {|el| el}).to eq(my_range.each {|el| el})
    # end

    # it 'should return each item key a given hash-rage' do
    #   expect(my_hash.my_each {|key, value| key}).to eq(my_hash.each {|key, value| key})
    # end
  end

  context 'test my_each_with_index' do
    # it 'should return enumerator object if block is not given' do
    #   expect(my_array.my_each_with_index.instance_of?(Enumerator)).to be(true)
    # end

    # it 'should return every even element' do
    #    expect(my_array.my_each_with_index {|el, index| el if index.even? }).to eql(my_array.each_with_index {|el, index| el if index.even? })
    # end

    #   it 'should return every even element' do
    #     expect(my_array.my_each_with_index {|el, index| el if index%3 ==0 }).to eql(my_array.each_with_index {|el, index| el if index%3 ==0})
    #  end

    # it 'should return each item from a given range' do
    #   expect(my_range.my_each_with_index {|el| el}).to eq(my_range.each_with_index {|el| el})
    # end

    # it 'should return each item key a given hash-rage' do
    #   expect(my_hash.my_each_with_index {|key, value| key}).to eq(my_hash.each_with_index {|key, value| key})
    # end
  end

  context 'test my_select' do
    # it 'should return enumerator object if block is not given' do
    #   expect(my_array.my_select.instance_of?(Enumerator)).to be(true)
    # end

    # it 'should return every element except the selected element' do
    #   expect(my_array.my_select{ |el| el != 'Brian' }).to eql(my_array.select{ |el| el != 'Brian' })
    # end

    # it 'should return every selected element' do
    #   expect(my_array.my_select{ |el| el == 'Brian' }).to eql(my_array.select{ |el| el == 'Brian' })
    # end

    # it 'should return element from range' do
    #   expect(my_range.my_select{ |el| el == 5 }).to eql(my_range.select{ |el| el == 5 })
    # end

    #  it 'should return every element except the selected element' do
    #   expect(my_range.my_select{ |el| el != 5 }).to eql(my_range.select{ |el| el != 5 })
    # end

    # it 'should select the key which is equal to blocks condition' do
    #    expect(my_hash.my_select{ |key,value| key == :a }).to eql({:a=>"abs"})
    # end

  end

  context 'test my_all' do
    # it 'should return true if there is no block and array is empty' do
    #   expect([].my_all?).to eq(true)
    # end

    # it 'should return true if every item is numeric' do
    #   expect([1, 2i, 3.14].my_all?(Numeric)).to eq(true)
    # end

    # it 'should check if regex is consists in every element and return false' do
    #   expect(%w[ant bear cat].my_all?(/t/)).to eq(false)
    # end

    # it 'should check if regex is consists in every element and return true' do
    #   expect(%w[ant bat cat].my_all?(/t/)).to eq(true)
    # end

    # it 'should check if every element length is equal 3' do
    #   expect(%w[ant bat cat].my_all? { |word| word.length == 3 }).to eq(true)
    # end

    # it 'should check if every element length is greater than 3' do
    #   expect(my_array.my_all? { |word| word.length > 3 }).to eq(false)
    # end

    # it 'should check if every element inside range is positive' do
    #   expect(my_range.my_all? { |el| el.positive? }).to eq(true)
    # end

    # it 'should check if every element inside range is negative' do
    #   expect((-3 .. -90).my_all? { |el| el.negative? }).to eq(true)
    # end
    
  end

  context 'test my_any' do
    # it 'should return false if there is no block and array is empty' do
    #   expect([].any?).to eq(false)
    # end

    # it 'should return true if any of items is numeric' do
    #   expect([1, 'f', 3.14].my_any?(Numeric)).to eq(true)
    # end

    # it 'should check if regex is consists in every element and return false' do
    #   expect(%w[ant bear cat].my_any?(/t/)).to eq(true)
    # end

    # it 'should check if regex is consists in any element and return false' do
    #   expect(%w[ant bat cat].my_any?(/l/)).to eq(false)
    # end

    # it 'should check if any element length is equal 4' do
    #   expect(%w[lion bat cat].my_any? { |word| word.length == 4 }).to eq(true)
    # end

    # it 'should check if any element length is greater than 3' do
    #   expect(%w[ant bat cat].my_any? { |word| word.length > 3 }).to eq(false)
    # end

    # it 'should check if any element inside range is positive' do
    #   expect((-3 .. 8).my_any? { |el| el.positive? }).to eq(true)
    # end

    # it 'should check if any element inside range is negative' do
    #   expect(my_range.my_any? { |el| el.negative? }).to eq(false)
    # end
    
  end

end

