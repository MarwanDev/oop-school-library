require_relative '../book'

describe Book do
  before :each do
    @book = Book.new 'Title', 'Author'
    @book.rentals = []
  end

  describe '#new' do
    it 'takes three parameters and returns a Book object' do
      @book.should be_an_instance_of Book
    end
  end

  describe '#title' do
    it 'returns the correct title' do
      @book.title.should eql 'Title'
    end
  end

  describe '#author' do
    it 'returns the correct author' do
      @book.author.should eql 'Author'
    end
  end

  describe '#rentals' do
    it 'returns the correct author' do
      @book.rentals.should eql []
    end
  end
end
