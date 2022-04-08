# rubocop:disable Lint/UnreachableLoop
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength

require './teacher'
require './student'
require './rental'
require './person'
require './classroom'
require './book'

# utilities
def pick_selection(selection, option)
  selection.each_with_index do |item, index|
    return item if index == option.to_i
  end
end

def validate(param_one = 'value', param_two = 'value', param_three = 'value')
  if param_one == '' || param_two == '' || param_three == ''
    puts 'Empty Input is not allowed'
    false
  else
    true
  end
end

def person_creation(option)
  case option
  when '1'
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp
    pass_check = validate(age, name, permission)
    return unless pass_check == true

    permission = permission[0].downcase != 'n'
    Student.new(age, name, permission)
  when '2'
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    pass_check = validate(age, name, specialization)
    return unless pass_check == true

    Teacher.new(age, specialization, name)
  else
    puts 'Wrong Input'
  end
end

# class App
class App
  def list_books(book_lists)
    puts 'Book not created yet' if book_lists.empty?
    book_lists.each do |item|
      print %(Title: "#{item.title}", Author: #{item.author} )
      print("\n")
    end
    puts ''
  end

  def list_people(person)
    puts 'Person not created yet' if person.empty?
    person.each do |item|
      puts %([#{item.class}] Name: #{item.name}, ID: #{item.id}, Age: #{item.age})
    end
    puts ''
  end

  def create_person(person)
    print 'Do you want to create a student (1) or a teacher (2)? [input the number]: '
    option = gets.chomp
    result = person_creation(option)
    return if result.nil?

    person << result
    puts 'Person created successfully'
    puts ' '
  end

  def create_books(book)
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    pass_check = validate(title, author)
    return unless pass_check == true

    new_book = Book.new(title, author)
    book << new_book
    puts 'Book created successfully'
    puts ' '
  end

  def create_rental(person, book)
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
    Rental.new(rental_date, selected_person, selected_book)
    puts 'Rental created successfully'
    puts ''
  end

  def list_all_rental(person)
    person_selected = nil
    loop do
      print 'ID of person: '
      person_id = gets.chomp
      person_selected = person.filter { |item| item.id == person_id.to_i }
      puts 'Rentals: '
      print "\n"
      person_selected[0]&.rental&.each do |item|
        puts %( Date: #{item.date}, Book: "#{item.book.title}" by #{item.book.author})
      end
      puts ''
      return
    end
  end
end
