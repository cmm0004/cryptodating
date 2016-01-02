require 'spec_helper'

describe 'pdf helpers' do
  describe 'define_file' do
    it 'makes the file name correctly' do
      incoming_params = {:bleed => 'on', :name => 'Candice',  :area_code => '463', :first_three => '272', :last_four => '7793'}
      expected = '4632727793'
      expect(Cryptodating::PDFHelpers::define_file(incoming_params)).to eq(expected)
    end
  end
end