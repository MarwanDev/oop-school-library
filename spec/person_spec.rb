require_relative '../person'
require_relative '../book'
require_relative '../rental'


describe Person do
  before :each do
    @person = Person.new 'Student', 15, 'Ahmed'
    @book = Book.new 'Title', 'Author'
  end

  describe '#new' do
    it 'takes three parameters and returns a Person object' do
      @person.should be_an_instance_of Person
    end
  end

  describe '#name' do
    it 'returns the correct type' do
      @person.name.should eql 'Ahmed'
    end
  end
  describe '#age' do
    it 'returns the correct name' do
      @person.age.should eql 15
    end
  end

  describe '#rentals' do
    it 'returns the correct rentals empty array' do
      @person.rentals.should eql []
    end
  end

  describe '#correct_name' do
    it 'returns the correct name' do
      person = Person.new 'Student', 15, 'Ahmed'
      expect(person.correct_name).to eql 'Ahmed'
    end
  end
  describe '#add_rental'
  it 'The add_rental method returns a rental and adds its to the person' do
    book = Book.new('Title', 'Author')
    Rental.new '2023/06/30', book, @person
    @person.add_rental('2023/06/30', book)
    expect(@person.rentals.length).to eql 1
  end
  describe '#can_use_service' do
    it 'tells whether person can use service' do
      expect(@person.can_use_services?).to be_truthy
    end
  end
end
