require_relative '../student'

describe Student do
  before :each do
    @student = Student.new 15, true, 'Student', 'Ahmed'
  end

  describe '#new' do
    it 'takes four parameters and returns a Student object' do
      @student.should be_an_instance_of Student
    end
  end

  describe '#name' do
    it 'returns the correct name' do
      @student.play_hooky.should eql '¯(ツ)/¯'
    end
  end
end
