require 'spec_helper'

describe "endpoint helpers" do
  describe 'convert_base' do
    it 'converts incoming numbers to array of altered base numbers' do
      expected = [1, 8, 2]
      expect(Cryptodating::MathHelpers::convert_base '827').to eq(expected)
    end

    it 'handles single leading zeros correctly' do
      expected = ['_', 1, 0]
      expect(Cryptodating::MathHelpers::convert_base '025').to eq(expected)
    end

    it 'handles multiple leading zeros correctly' do
      expected = ['_', '_', 5]
      expect(Cryptodating::MathHelpers::convert_base '005').to eq(expected)
    end

    it 'works with either string or int input' do
      expected = [1, 8, 2]
      expect(Cryptodating::MathHelpers::convert_base '827').to eq(expected)
      expect(Cryptodating::MathHelpers::convert_base 827).to eq(expected)
     end
  end
end