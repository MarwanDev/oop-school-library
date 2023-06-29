require_relative '../nameable'
require_relative '../decorator'

describe Decorator do
  before :each do
    @nameable = Nameable.new
    @decorator = Decorator.new @nameable
  end

  describe '#new' do
    it 'takes one parameters and returns a Decorator object' do
      @decorator.should be_an_instance_of Decorator
    end
  end
end

class MockNameable < Nameable
  def correct_name
    'Name'
  end
end

describe Decorator do
  let(:nameable) { MockNameable.new }

  describe '#correct_name' do
    it 'returns the correct name' do
      decorator = Decorator.new(nameable)
      expect(decorator.correct_name).to eq('Name')
    end
  end

  describe '#run' do
    it 'runs the decorator class' do
      decorator = Decorator.new(nameable)
      expect(decorator.nameable).to eq(nameable)
    end
  end
end
