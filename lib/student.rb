class Student
  attr_reader :first_name,
    :last_name,
    :middle_initial,
    :campus,
    :favorite_color,
    :date_of_birth,
    :age

  CAMPUSES = {
    LA: 'Los Angeles',
    NYC: 'New York City',
    SF: 'San Francisco'
  }

  def initialize(params)
    if params.size > 1 && params.kind_of?(Hash)
      params.each { |k, v|  instance_variable_set("@#{k}", v) unless v.nil? }
      normalize_dob
      normalize_campus
      calculate_age
    else
      raise ArguementError
    end
  end

  def display
    "#{last_name} #{first_name} #{campus} #{date_of_birth} #{favorite_color}"
  end

  private

  def normalize_dob
    @date_of_birth = date_of_birth.gsub(/-/, '/')
  end

  def normalize_campus
    @campus =  CAMPUSES[campus.to_sym] if CAMPUSES.key? campus.to_sym
  end

  def calculate_age
    birthday = Date.strptime(date_of_birth, '%m/%d/%Y')
    Date.today.year - birthday.year
  end
end
