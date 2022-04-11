require './teacher'
require './student'
require './rental'
require './person'
require './classroom'
require './book'
require './utilities'

# class App
class App
  include AppUtil
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
    result = AppUtil.person_creation
    return if result.nil?

    person << result
    puts 'Person created successfully'
    puts ' '
  end

  def create_books(book)
    title, author = AppUtil.read_user_basic_input('title', 'author')
    pass_check = AppUtil.validate(title, author)
    return unless pass_check == true

    new_book = Book.new(title, author)
    book << new_book
    puts 'Book created successfully'
    puts ' '
  end

  def create_rental(person, book)
    rental_date, selected_person, selected_book = AppUtil.process_rental(person, book)
    Rental.new(rental_date, selected_person, selected_book)
    puts 'Rental created successfully'
    puts ''
  end

  def list_all_rental(person)
    print 'ID of person: '
    person_id = gets.chomp
    person_selected = person.filter { |item| item.id == person_id.to_i }
    puts 'Rentals: '
    print "\n"
    person_selected[0]&.rental&.each do |item|
      puts %( Date: #{item.date}, Book: "#{item.book.title}" by #{item.book.author})
    end
    puts ''
  end
end
