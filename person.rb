require './decorator'

# class for person
class Person < Nameable
  attr_accessor :age, :name
  attr_reader :id, :rental

  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = Random.rand(1...1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rental = []
  end

  def can_use_services
    of_age || @parent_permission
  end

  def correct_name
    name
  end

  def add_rental(book, date)
    @rental.push(Rental.new(date, self, book)) unless @rental.include?(Rental.new(date, self, book))
  end

  private

  def of_age
    @age >= 18
  end
end
