class Teacher < Person
  def initialize(name = 'Unkown', age, parent_permission = true, specialization)
    super(name, age, parent_permission)
    @specialization = specialization
  end
  def can_use_services?
    true
  end
end