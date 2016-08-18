class Student
  attr_reader :last_name,
    :first_name,
    :middle_initial,
    :campus,
    :favorite_color,
    :date_of_birth

  def self.from_json(json)
    Student.new.tap do |s|
      s.first_name      = json["first_name"]
      s.last_name       = json["last_name"]
      s.middle_initial  = json["middle_initial"]
      s.campus          = json["campus"]
      s.favorite_color  = json["favorite_color"]
      s.date_of_birth   = json["date_of_birth"]
    end
  end
end
