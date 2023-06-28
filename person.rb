require_relative 'nameable'
require_relative 'decorator'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require 'securerandom'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(type, age, name = 'Unkown', parent_permission: true)
    super()
    @id = SecureRandom.uuid
    @name = name
    @age = age
    @type = type
    @parent_permission = parent_permission
    @rentals = []
  end

  def args
    {
      id: @id,
      name: @name,
      age: @age,
      type: @type
    }
  end

  def can_use_services?
    of_age || @parent_permission
  end

  def correct_name
    name
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    age >= 18
  end
end
