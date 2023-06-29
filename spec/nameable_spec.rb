require_relative '../nameable'

describe 'CapitalizeDecorator' do
  before :each do
    @nameable = Nameable.new
  end

  describe '#new' do
    it 'takes one parameters and returns a Nameable object' do
      @nameable.should be_an_instance_of Nameable
    end
  end

  describe '#NotImplementedError' do
    it 'raises a NotImplementedError after calling' do
      expect { @nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
