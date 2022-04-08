# frozen_string_literal: true

require './person'

# class Teacher
class Teacher < Person
  def initialize(age, specialization, name = 'unknown')
    super(age, name)
    @specialization = specialization
  end
end
