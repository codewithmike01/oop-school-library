# class for person
class Person
  attr_accessor :age, :name
  attr_reader :id

  def initialize(age, name = 'unknown', parent_permission: true)
    @age = age
    @name = name
    @id = Random.rand(1...1000)
    @parent_permission = parent_permission
  end

  def can_use_services
    of_age || @parent_permission
  end

  private

  def of_age
    @age >= 18
  end
end
