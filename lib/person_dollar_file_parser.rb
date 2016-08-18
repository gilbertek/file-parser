class PersonDollarFileParser
  attr_reader :person_hash

  DELIMITER_PATTERN = /\s+\$\s+/.freeze

  HEADERS = ['last_name', 'first_name', 'middle_initial', 'campus', 'date_of_birth', 'favorite_color'].freeze

  def initialize(data)
    @data        = data
    @person_hash = build_from_data
  end

  def normalize
    Student.new(person_hash)
  end

  def self.is_dollar_separated? line
    line =~ DELIMITER_PATTERN
  end

  private

  attr_reader :data

  def build_from_data
    HEADERS.zip(data.split(DELIMITER_PATTERN)).to_h
  end
end
