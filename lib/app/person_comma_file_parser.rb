module App
  class PersonCommaFileParser
    attr_reader :person_hash

    DELIMITER_PATTERN = /\,./.freeze

    HEADERS = ['last_name', 'first_name', 'campus', 'favorite_color', 'date_of_birth'].freeze

    def initialize(data)
      @data = data
      @person_hash = build_from_data
    end

    def normalize
      Student.new(person_hash)
    end

    def self.is_comma_separated? line
      line =~ DELIMITER_PATTERN
    end

    private

    attr_reader :data

    def build_from_data
      HEADERS.zip(data.split(DELIMITER_PATTERN)).to_h
    end
  end
end
