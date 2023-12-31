class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    rental = Rental.new(date, self, person)
    rentals.push(rental)
  end

  def to_json(*args)
    {
      title: @title,
      author: @author
    }.to_json(*args)
  end
end
