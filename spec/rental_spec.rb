require_relative '../person'
require_relative '../book'
require_relative '../rental'

describe Rental do
  before :each do
    @person = Person.new 'Student', 15, 'Ahmed'
    @book = Book.new 'Title', 'Author'
    @rental = Rental.new '2023/06/29', @book, @person
  end

  describe '#new' do
    it 'takes three parameters and returns a Rental object' do
      @rental.should be_an_instance_of Rental
    end
  end

  describe '#date' do
    it 'returns the correct date' do
      @rental.date.should eql '2023/06/29'
    end
  end

  describe '#person' do
    it 'returns the correct date' do
      @rental.person.should eql @person
    end
  end

  describe '#person' do
    it 'returns the correct date' do
      @rental.book.should eql @book
    end
  end
end
