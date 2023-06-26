class Input
  def input
    gets.chomp
  end

  def input_int
    gets.chomp.to_i
  end

  def parent_permission
    gets.chomp.downcase == 'y'
  end
end
