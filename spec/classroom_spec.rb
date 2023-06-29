require_relative '../classroom'

describe Classroom do
  before :each do
    @classroom = Classroom.new 'Seniors'
    @classroom.students = []
  end

  describe '#new' do
    it 'takes one parameter and returns a Classroom object' do
      @classroom.should be_an_instance_of Classroom
    end
  end
  describe 'students' do
    it 'adds a student to the classroom' do
      @classroom.students.should eq []
    end
  end
end
