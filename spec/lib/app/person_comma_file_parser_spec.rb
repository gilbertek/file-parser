require 'spec_helper'

describe App::PersonCommaFileParser do
  let(:params) { 'Kirlin, Mckayla, Atlanta, Maroon, 5/29/1986' }
  let(:subject) { described_class.new(params) }

  describe '#normalize' do
    it 'returns a valid student' do
      expect(subject.normalize).to be_a_kind_of(App::Student)
    end
  end
end
