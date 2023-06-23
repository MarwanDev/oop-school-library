require_relative './person'

class Student < Person
  def initialize(age, name = 'Unkown', parent_permission)
    super(age, name)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
