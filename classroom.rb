require './student'

# class classroom
class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student, label)
    @students << { student: student, label: label }
  end
end
