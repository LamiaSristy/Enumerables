require './lib/enumerable.rb'

RSpec.describe 'my enumerable methods' do
  let(:my_array) { %w[Sharon Leo Leila Brian Arun] }

  context 'test my_each' do
    it 'should return enumerator object if block is not giver' do
      expect(my_array.my_each.instance_of?(Enumerator)).to be(true)
    end

    it 'should print each array items' do
      expect(my_array.my_each {|el| el}).to eq(my_array.each {|el| el})
    end
  end
end
