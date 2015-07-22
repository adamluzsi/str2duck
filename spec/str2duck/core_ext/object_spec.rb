require 'spec_helper'
describe Str2Duck::CoreExt::Object do
  subject { Object.new }

  describe '#to_duck' do
    context 'when string given' do
      it { expect('123'.to_duck).to eq 123 }
    end

    context 'when not string given' do
      subject{ Object.new }
      it 'should return the object back' do
        expect(subject.to_duck).to equal subject
      end
    end

  end

end