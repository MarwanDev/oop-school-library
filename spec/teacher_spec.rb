require_relative '../teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new 15, 'Chemistry', 'Teacher', 'Ahmed'
  end

  describe '#new' do
    it 'takes four parameters and returns a Teacher object' do
      @teacher.should be_an_instance_of Teacher
    end
  end
  describe '#name' do
    it 'returns whether teacher can use service' do
      @teacher.can_use_services?.should be_truthy
    end
  end
end
