require_relative '../nameable'
require_relative '../decorator'
require_relative '../trimmer_decorator'

describe 'CapitalizeDecorator' do
  before :each do
    @nameable = Nameable.new
    @decorator = Decorator.new @nameable
    @trimmer_decorator = TrimmerDecorator.new 'Name'
  end

  describe '#new' do
    it 'takes one parameters and returns a TrimmerDecorator object' do
      @trimmer_decorator.should be_an_instance_of TrimmerDecorator
    end
  end

  describe '#capitalize_name' do
    it 'capitalizes the name using the base decorator' do
      input = double('input')
      allow(input).to receive(:correct_name).and_return('sample name')
      trimmer_decorator = TrimmerDecorator.new(input)
      result = trimmer_decorator.correct_name
      expect(result).to eq('sample nam')
    end
  end
end
