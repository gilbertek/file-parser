require 'spec_helper'

describe App::PersonDollarFileParser do
  let(:params) { 'Bruen $ Rigoberto $ F $ SF $ 12-1-1962 $ Raw Umber' }
  let(:subject) { described_class.new(params) }

  describe '#normalize' do
    it 'returns a valid student' do
      expect(subject.normalize).to be_a_kind_of(App::Student)
    end
  end
end
