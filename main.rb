require './app'
require './utilities'

collectable = { books: [], person: [] }
def main(store)
  app = App.new
  util = Util.new
  option = nil
  store[:books] = app.load_books
  store[:person] = app.load_people
  while option != '7'
    util.menu_display
    option = gets.chomp
    case option
    when '1'
      app.list_books(store[:books])
    when '2'
      app.list_people(store[:person])
    when '3'
      app.create_person(store[:person])
    when '4'
      app.create_books(store[:books])
    when '5'
      app.create_rental(store[:person], store[:books])
    when '6'
      app.list_all_rental(store[:person])
    when '7'
      puts "\n"
      puts 'Exited successfully, thank you for using this app 👍😊💪'
      app.save_books(store[:books])
      app.save_people(store[:person])
    else
      puts 'Wrong input'
    end
  end
end

main(collectable)
