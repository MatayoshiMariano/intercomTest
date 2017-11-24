require_relative './spec_helper'
require_relative '../array'

RSpec.describe Array do

  describe '#custom_flatten' do

    describe 'a nested array of integers' do

      let!(:nested_array) { [[4, 5], 6, [7, 8, 19, [1]]] }

      it 'will be flattened to one level array' do
        expected = [4, 5, 6, 7, 8, 19, 1]
        expect(nested_array.custom_flatten).to eq expected
      end

    end

    describe 'a nested array of mixed types' do

      let!(:nested_array) { [["4", 5], "6", [ 7.123, 8, 19, [3]]] }

      it 'will be flattened to one level array' do
        expected = ["4", 5, "6", 7.123, 8, 19, 3]
        expect(nested_array.custom_flatten).to eq expected
      end

    end

    describe 'a flat array of integers' do

      let!(:flat_array) { [4, 5, 6, 7, 8, 19, 1] }

      it 'will be the same' do
        expect(flat_array.custom_flatten).to eq flat_array
      end

    end

  end

end
