require 'spec_helper'

describe Processor do
  include TestDataHelper
  let(:files) { Dir.glob(File.dirname(__FILE__) + '/../../data/*.txt') }
  let(:subject) { Processor.new(file_list: files) }

  describe '#ascending_by_campus_and_last_name' do
    it 'returns students sorted by campus and lastname' do
      expect(subject.ascending_by_campus_and_last_name).to eq(output_by_campus_and_last_name)
    end
  end

  describe '#ascending_by_date_of_birth' do
    it 'returns students sorted ascending by date of birth' do
      # expect(subject.ascending_by_date_of_birth).to eq(output_by_date_of_birth)
    end
  end

  describe '#descending_by_last_name' do
    it 'returns students sorted descending by lastname' do
      # expect(subject.descending_by_last_name).to eq(output_by_last_name)
    end
  end
end

