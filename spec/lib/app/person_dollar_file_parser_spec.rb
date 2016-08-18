require 'spec_helper'

describe App::PersonDollarFileParser do
  let(:params) { 'Bruen $ Rigoberto $ F $ SF $ 12-1-1962 $ Raw Umber' }
  let(:subject) { described_class.new(params) }

  describe '#normalize' do
    it 'returns a valid student' do
      expect(subject.normalize).to be_a_kind_of(App::Student)
    end
  end

  describe '.is_dollar_separated?' do
    it 'returns true for valid dollar separated file' do
      expect(described_class.is_dollar_separated?(params)).to be_truthy
    end
  end
end
