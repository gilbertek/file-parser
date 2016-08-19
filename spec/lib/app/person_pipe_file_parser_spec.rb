require 'spec_helper'

describe App::PersonPipeFileParser do
  let(:params) { 'Barrows | Anika | U | Hong Kong | Spring Green | 5-5-1965' }
  let(:subject) { described_class.new(params) }

  describe '#normalize' do
    it 'returns a valid student' do
      expect(subject.normalize).to be_a_kind_of(App::Person)
    end
  end

  describe '.is_pipe_separated?' do
    it 'returns true for valid pipe separated file' do
      expect(described_class.is_pipe_separated?(params)).to be_truthy
    end
  end
end
