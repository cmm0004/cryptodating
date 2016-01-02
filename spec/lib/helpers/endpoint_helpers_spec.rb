require 'spec_helper'

describe "endpoint helpers" do
  describe 'format_post_params' do
    it 'should return the params hash' do
      incoming_params = {:name => 'candice', :area_code => '555', :first_three => '555', :last_four => '5555'}
      expected = {:name => 'candice', :area_code => [22, 5], :first_three => [22, 5], :last_four => [8, 22, 5]}
      expect(Cryptodating::EndpointHelpers::format_post_params incoming_params).to eq(expected)
    end
  end
  describe "enforce_name_length" do
    it "should return any string 10 chars or less" do
      expect(Cryptodating::EndpointHelpers::enforce_name_length('aaa')).to eq('aaa')
      expect(Cryptodating::EndpointHelpers::enforce_name_length('aaaaaaaaaa')).to eq('aaaaaaaaaa')

    end

    it "should return the first 10 chars of a string longer than 10" do
      expect(Cryptodating::EndpointHelpers::enforce_name_length('abcaaaaaaaaaaaaaaaaa')).to eq('abcaaaaaaa')
    end
  end
end