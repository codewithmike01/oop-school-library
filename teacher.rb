require_relative './person'

# class Teacher
class Teacher < Person
  def initialize(age, specialization, name = 'unknown')
    super(age, name)
    @specialization = specialization
  end
end
