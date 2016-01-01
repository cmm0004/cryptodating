require 'spec_helper'

describe "endpoint helpers" do
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