require_relative '../book'

describe Book do
  before(:all) do
    @book = Book.new('Grey jones Home', 'Feddy Hooks')
  end
  context 'Tesing the book class' do
    it 'has instance of book' do
      expect(@book).to be_instance_of Book
    end

    it 'has return value title' do
      expect(@book.title).to eq 'Grey jones Home'
    end

    it 'has return value author' do
      expect(@book.author).to eq 'Feddy Hooks'
    end
  end
end
