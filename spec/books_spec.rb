require_relative '../book'
require_relative '../person'


describe Book do
  before :each do
    @person = Person.new 'Student', 15, 'Ahmed'
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
  describe '#add_rental' do
    it 'adds a rental' do
      expect(@book).to respond_to(:add_rental)
    end
  end
  describe '#add_rental'
  it 'The add_rental method returns a rental and adds its to the book' do
    book = Book.new('Title', 'Author')
    person = Person.new 'Student', 15, 'Ahmed'
    book.add_rental('2023/06/30', person)
    expect(book.rentals.length).to eql 1
  end
end
