require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, specialization, type, name = 'Unkown')
    super(age, name, type)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
