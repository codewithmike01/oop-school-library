require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  before(:all) do
    person = Person.new(12, 'Feddy Hooks', parent_permission: false)
    book = Book.new('Grey jones Home', 'Feddy Hooks')
    @rental = Rental.new('2022/04/13', person, book)
  end
  context 'Tesing the rental class' do
    it 'has instance of rental' do
      expect(@rental).to be_instance_of Rental
    end

    it 'has return value date' do
      expect(@rental.date).to eq('2022/04/13')
    end

    it 'has return value person name' do
      expect(@rental.person.name).to eq 'Feddy Hooks'
    end

    it 'has return value book title' do
      expect(@rental.book.title).to eq 'Grey jones Home'
    end
  end
end