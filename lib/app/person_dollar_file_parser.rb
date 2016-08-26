module App
  class PersonDollarFileParser < FileParser
    DELIMITER_PATTERN = /\s+\$\s+/.freeze

    HEADERS = ['last_name', 'first_name', 'middle_initial', 'campus', 'date_of_birth', 'favorite_color'].freeze

    def normalize
      Person.new(person_hash)
    end

    def self.is_dollar_separated?(line)
      line =~ DELIMITER_PATTERN
    end

    private

    def build_from_data
      HEADERS.zip(data.split(DELIMITER_PATTERN)).to_h
    end
  end
end
