class Processor

  def initialize(file_list:)
    @file_list = file_list
    @collections = build_list
  end

  def ascending_by_campus_and_last_name
    byebug
  end

  def ascending_by_date_of_birth

  end

  def descending_by_last_name

  end

  private

  attr_reader :file_list, :collections

  def build_list
    file_list.map { |path| input_from_file(path) }.flatten
  end

  def input_from_file(file_path)
    result = []
    File.open(file_path, 'r').each_line do |line|
      result << parse(line.chomp)
    end

    result
  end

  def parse(line)
    case
    when is_dollar_separated?(line)
      PersonDollarFileParser.new(line)
    when is_pipe_separated?(line)
      PersonPipeFileParser.new(line)
    when is_comma_separated?(line)
      PersonCommaFileParser.new(line)
    end
  end

  def is_dollar_separated?(line)
    PersonDollarFileParser.is_dollar_separated?(line)
  end

  def is_pipe_separated?(line)
    PersonPipeFileParser.is_pipe_separated?(line)
  end

  def is_comma_separated?(line)
    PersonCommaFileParser.is_comma_separated?(line)
  end

end
