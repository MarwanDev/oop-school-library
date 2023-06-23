require_relative 'person'

class Student < Person
  def initialize(age, _parent_permission, name = 'Unkown')
    super(age, name)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
