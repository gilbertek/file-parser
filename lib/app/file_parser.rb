module App
  class FileParser
    CAMPUSES = {
      LA: 'Los Angeles',
      NYC: 'New York City',
      SF: 'San Francisco'
    }.freeze

    def initialize(data)
      @data        = data
    end

    def normalize
      raise NotImplementedError, "subclass did not define #normalize"
    end

    private

    attr_reader :data, :person_hash
  end
end
