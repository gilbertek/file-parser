module App
  class PersonPipeFileParser < FileParser
    attr_reader :person_hash

    DELIMITER_PATTERN = /\s+\|\s+/.freeze

    HEADERS = ['last_name', 'first_name', 'middle_initial', 'campus', 'favorite_color', 'date_of_birth'].freeze

    def normalize
      Person.new(person_hash)
    end

    def self.is_pipe_separated?(line)
      line =~ DELIMITER_PATTERN
    end

    private

    def build_from_data
      HEADERS.zip(data.split(DELIMITER_PATTERN)).to_h
    end
  end
end
