require './lib/enumerable.rb'

RSpec.describe 'my enumerable methods' do
  let(:my_array) { %w[Sharon Leo Leila Brian Arun] }
  let(:my_range) {(5..10) }
  let(:my_hash) {{a:'abs', b:'cdr'}}
  let(:num_array){[1,2,3,4,5]}



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
    
    it 'should return each item from a given range' do
      expect(my_range.my_each_with_index {|el| el}).to eq(my_range.each_with_index {|el| el})
    end

    it 'should return each item key a given hash-rage' do
      expect(my_hash.my_each_with_index {|key, value| key}).to eq(my_hash.each_with_index {|key, value| key})
    end

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
    
  end


end
