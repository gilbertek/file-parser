require 'spec_helper'

describe App::PersonPipeFileParser do
  let(:params) { 'Barrows | Anika | U | Hong Kong | Spring Green | 5-5-1965' }
  let(:subject) { described_class.new(params) }

  describe '#normalize' do
    it 'returns a valid student' do
      expect(subject.normalize).to be_a_kind_of(App::Student)
    end
  end
end
