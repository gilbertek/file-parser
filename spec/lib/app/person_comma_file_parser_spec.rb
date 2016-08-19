require 'spec_helper'

describe App::PersonCommaFileParser do
  let(:params) { 'Kirlin, Mckayla, Atlanta, Maroon, 5/29/1986' }
  let(:subject) { described_class.new(params) }

  describe '#normalize' do
    it 'returns a valid student' do
      expect(subject.normalize).to be_a_kind_of(App::Person)
    end
  end

  describe '.is_comma_separated?' do
    it 'returns true for valid comma separated file' do
      expect(described_class.is_comma_separated?(params)).to be_truthy
    end
  end
end
