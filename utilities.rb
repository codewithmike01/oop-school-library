# For main.rb
class Util
  def menu_display
    puts " Please choose an option by entering a number:
    1 -List all books
    2 -List all people
    3 -Create a person
    4 -Create a book
    5 -Create a rental
    6 -List all rentals for a given person id
    7 -Exit"
  end
end

# utilities for app.rb
module AppUtil
  def self.pick_selection(selection, option)
    selection.each_with_index do |item, index|
      return item if index == option.to_i
    end
  end

  def self.validate(param_one = 'value', param_two = 'value', param_three = 'value')
    if param_one == '' || param_two == '' || param_three == ''
      puts 'Empty Input is not allowed'
      false
    else
      true
    end
  end

  def self.read_user_basic_input(param_one, param_two)
    print %(#{param_one}: )
    param_one = gets.chomp
    print %(#{param_two}: )
    param_two = gets.chomp
    [param_one, param_two]
  end

  def self.person_messenger_student
    age, name = read_user_basic_input('age', 'name')
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp
    pass_check = validate(age, name, permission)
    return unless pass_check == true

    permission = permission[0].downcase != 'n'
    [age, name, permission]
  end

  def self.person_messenger_teacher
    age, name = read_user_basic_input('age', 'name')
    print 'Specialization: '
    specialization = gets.chomp
    pass_check = validate(age, name, specialization)
    return unless pass_check == true

    [age, name, specialization]
  end

  def self.define_person(type, age, name, permission=nil,specialization=nil)
    case type
    when 'Student'
      Student.new(age, name, permission)
    when 'Teacher'
      Teacher.new(age, specialization, name)
    end
  end

  def self.person_creation
    print 'Do you want to create a student (1) or a teacher (2)? [input the number]: '
    option = gets.chomp
    case option
    when '1'
      age, name, permission = person_messenger_student
      self.define_person('Student', age, name, permission)
    when '2'
      age, name, specialization = person_messenger_teacher
      self.define_person('Teacher', age, name, specialization)
    else
      puts 'Wrong Input'
    end
  end

  def self.process_rental(person, book)
    selection_book = []
    selection_person = []
    puts 'Select book from the following list by number'
    book.each_with_index do |item, index|
      puts %( #{index}\) Title: "#{item.title}", Author: #{item.author})
      selection_book << item
    end
    selected_book_option = gets.chomp
    selected_book = pick_selection(selection_book, selected_book_option)
    puts ''
    puts 'Select a person from the following list by number (not id)'
    person.each_with_index do |item, index|
      puts %( #{index}\) [#{item.class}] Name: #{item.name}, ID: #{item.id}, Age: #{item.age} )
      selection_person << item
    end
    selection_person_option = gets.chomp
    selected_person = pick_selection(selection_person, selection_person_option)
    puts ''
    print 'Date: '
    rental_date = gets.chomp
    [rental_date, selected_person, selected_book]
  end
end
