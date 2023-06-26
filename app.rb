require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'rental'
require_relative 'classroom'
require_relative 'teacher'
require_relative 'input'

class App
  attr_accessor :books, :persons, :classroom, :rentals

  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def add_person()
    puts 'Do you want to add a student (1) or a teacher (2)? [Input the number]'
    is_student = Input.new.input_int
    puts 'Age'
    age = Input.new.input_int
    puts 'Name'
    name = Input.new.input
    case is_student
    when 1
      puts 'Has parent permission? [Y/N]'
      parent_permission = Input.new.parent_permission
      student = Student.new(age, parent_permission, name)
      @persons.push(student)
    when 2
      puts 'Specialization'
      specialization = Input.new.input
      teacher = Teacher.new(age, specialization, name)
      @persons.push(teacher)
    end
    puts 'Person added successfully.'
  end

  def add_book
    puts 'Title'
    title = Input.new.input
    puts 'Author'
    author = Input.new.input
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book added successfully.'
  end

  def add_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_index = Input.new.input_int
    puts 'Select a person from the following list by number (not Id)'
    @persons.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = Input.new.input_int
    puts 'Date'
    date = Input.new.input
    rental = Rental.new(date, @books[book_index], @persons[person_index])
    @rentals.push(rental)
    puts 'Rental added sucessfully'
  end

  def list_all_people
    @persons.each do |person|
      if person.instance_of?(Student)
        puts "[Student], ID: #{person.id}, Name: #{person.name}, age: #{person.age}"
      else
        puts "[Teacher], ID: #{person.id}, Name: #{person.name}, age: #{person.age}"
      end
    end
  end

  def list_rentals
    puts 'ID of person'
    person_id = Input.new.input
    puts 'Rentals'
    @rentals.each do |rental|
      if rental.person.id == person_id
        puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
      end
    end
  end

  def list_all_books
    @books.each do |book|
      puts "Title: '#{book.title}', Author: #{book.author}"
    end
  end
end
