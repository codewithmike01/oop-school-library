require './app'

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

collectable = { books: [], person: [] }

def main(store)
  app = App.new
  option = nil

  while option != '7'
    menu_display
    option = gets.chomp
    case option
    when '1'
      app.list_boo(store[:books])
    when '2'
      app.list_people(store[:person])
    when '3'
      app.create_person(store[:person])
    when '4'
      app.create_books(store[:books])
    when '5'
      app.create_rental(store[:person], store[:books])
    when '6'
      app.list_all_rent(store[:person])
    when '7'
      puts "\n"
      puts 'Exited successfully, thank you for using this app 👍😊💪'
    else
      puts 'Wrong input'
    end
  end
end

main(collectable)
