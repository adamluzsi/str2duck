require 'spec_helper'
describe Str2Duck do

  describe '.parse' do

    let(:str){'123'}
    let(:args){[]}
    subject{ described_class.parse(str,*args) }

    context 'when no strategy passed only object to be parsed' do
      it { is_expected.to eq 123 }
    end

    context 'when args is limited to datetime type' do
      let(:args){[:datetime]}

      it { is_expected.to eq '123' }
    end

  end

end