require 'spec_helper'

describe App::Student do
  let(:subject) { described_class.new(student_hash) }

  describe '#age' do
    it 'returns student current age' do
      expect(subject.age).not_to be_nil
    end
  end

  describe '#display' do
    it 'outputs the formated student info for display' do
      expect(subject.display).to include(student_hash[:last_name])
    end
  end

  def student_hash
    {
      'last_name': 'Kirlin',
      'first_name': 'Mckayla',
      'campus': 'Atlanta',
      'favorite_color': 'Maroon',
      'date_of_birth': '5/29/1986'
    }
  end
end
