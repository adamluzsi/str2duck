require 'spec_helper'
describe Str2Duck::Converter do

  let(:str) { 'duck' }

  describe '#datetime' do
    subject { described_class.datetime(str) }

    context 'when the format is like \w+, \d+ \w+ \d+ \d\d:\d\d:\d\d \+\d+' do
      let(:str) { "Fri, 25 Jan 2013 20:02:15 +0100" }

      it { is_expected.to be_a DateTime }
    end

    context 'when the format is like /^-?\d+-\d\d-\d\d\w\d\d:\d\d:\d\d\+\d\d:\d\d$/' do
      let(:str) { "2012-09-12T14:49:50+02:00" }

      it { is_expected.to be_a DateTime }
    end

    context 'when the format is like /^-?\d+-\d\d?-\d\d?\w\d\d?:\d\d?:\d\d?\w$/' do
      let(:str) { "2012-09-12T14:49:50" }

      it { is_expected.to be_a DateTime }
    end

    context 'when invalid value given' do
      let(:str) { 'not-a-validTdatetime' }

      it { is_expected.to be nil }
    end

  end

  describe '#date' do

    subject { described_class.date(str) }

    context 'when the date format is like /^\d+-\d\d-\d\d$/' do
      let(:str) { "2011-03-12" }

      it { is_expected.to be_a Date }
    end

    context 'when the date format is like /^\w+, \d+ \w+ \d+$/' do
      let(:str) { "Sun, 28 Aug 2005" }

      it { is_expected.to be_a Date }
    end

  end

  describe '#time' do

    subject { described_class.time(str) }

    context 'when time format is like: /^\d+-\d\d-\d\d \d\d:\d\d:\d\d \+\d+$/' do
      let(:str) { "2010-10-30 18:02:56 +0200" }

      it { is_expected.to be_a Time }
    end

  end

  describe '#true' do
    it { expect(subject.true('true')).to be_a TrueClass }
    it { expect(subject.true('else')).to be nil }
  end

  describe '#false' do
    it { expect(subject.false('false')).to be_a FalseClass }
    it { expect(subject.false('else')).to be nil }
  end

  describe '#float' do
    it { expect(subject.float('123.5')).to be_a Float }
    it { expect(subject.float('123')).to be nil }
  end

  describe '#integer' do
    it { expect(subject.integer('123')).to be_a Integer }
    it { expect(subject.integer('123.1')).to be nil }
  end

  describe '#json' do
    before { require 'json' }
    it { expect(subject.json(JSON.dump({hello: :world}))).to be_a Hash }
    it { expect(subject.json('{not: "json"}')).to be nil }
  end

end