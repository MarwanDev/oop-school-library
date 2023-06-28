require_relative 'person'

class Student < Person
  def initialize(age, _parent_permission, type, name = 'Unkown')
    super(age, name, type)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
