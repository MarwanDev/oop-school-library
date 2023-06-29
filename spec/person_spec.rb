require_relative '../person'

describe Person do
  before :each do
    @person = Person.new 'Student', 15, 'Ahmed'
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
end
