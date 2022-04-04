# frozen_string_literal: true

require './person'
# class Teacher
class Teacher < Person
  def initialize(age, specialization, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission)
    @specialization = specialization
  end
end
