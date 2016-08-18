class Processor

  def initialize(file_list:)
    @file_list = file_list
    @collections = build_list
  end

  def ascending_by_campus_and_last_name
    byebug
    collections.sort_by { |e| [e.campus, e.last_name] }.map(&:display).join("\n")

        # collections.sort { |a, b| (a.campus <=> b.campus).nonzero? || (a.last_name <=> b.last_name) }.map(&:display).join("\n")
  end

  def ascending_by_date_of_birth
    byebug

    # collections.sort_by { |e| e.date_of_birth }.map(&:display).join("\n")

    collections.sort { |a, b|  b.age <=> b.age }.map(&:display).join("\n")
  end

  def descending_by_last_name
    collections.sort_by { |e| e.last_name }.reverse.map(&:display).join("\n")
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
      PersonDollarFileParser.new(line).normalize
    when is_pipe_separated?(line)
      PersonPipeFileParser.new(line).normalize
    when is_comma_separated?(line)
      PersonCommaFileParser.new(line).normalize
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
