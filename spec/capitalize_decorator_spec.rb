require_relative '../nameable'
require_relative '../decorator'
require_relative '../capitalize_decorator'

describe CapitalizeDecorator do
  before :each do
    @nameable = Nameable.new
    @decorator = Decorator.new @nameable
    @capitalize_decorator = CapitalizeDecorator.new 'Name'
  end

  describe '#new' do
    it 'takes one parameters and returns a Capitalize_decorator object' do
      @capitalize_decorator.should be_an_instance_of CapitalizeDecorator
    end
  end

  describe '#capitalize_name' do
    it 'capitalizes the name using the base decorator' do
      input = double('input')
      allow(input).to receive(:correct_name).and_return('ahmed')
      capitalize_decorator = CapitalizeDecorator.new(input)
      result = capitalize_decorator.correct_name
      expect(result).to eq('Ahmed')
    end
  end
end
