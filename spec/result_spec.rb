# frozen_string_literal: true

require_relative '../result'

RSpec.describe Result do
  describe '#calls methods defined in Result' do
    let(:result) { Result.new }

    it 'returns valid array of arrays for Array' do
      expect(result.call([1, 2, 3, 4, 5])).to eq([[[5, 4, 3, 2, 1]], [5], [[[1], [2], [3], [4]]]])
    end

    it 'returns valid array of hashes for Hash' do
      expect(result.call({ a: 1, b: 2,
                           c: 3 })).to eq([{ 1 => :a, 2 => :b, 3 => :c }, { [:a, 1] => nil, [:b, 2] => nil, [:c, 3] => nil },
                                           { a: 1, b: 2, c: 3 }])
    end
  end
end
