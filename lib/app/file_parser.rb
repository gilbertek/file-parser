module App
  class FileParser
    def initialize(data)
      @data        = data
      @person_hash = build_from_data
    end

    def normalize
      raise NotImplementedError, "subclass did not define #normalize"
    end

    private

    attr_reader :data, :person_hash

  end
end
