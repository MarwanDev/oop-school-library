require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'rental'
require_relative 'classroom'
require_relative 'teacher'

class App
  attr_accessor :books, :persons, :classroom, :rentals

  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def add_person()
    puts 'Do you want to add a student (1) or a teacher (2)? [Input the number]'
    is_student = gets.chomp.to_i
    puts 'Age'
    age = gets.chomp.to_i
    puts 'Name'
    name = gets.chomp

    case is_student
    when 1
      puts 'Has parent permission? [Y/N]'
      parent_permission = gets.chomp.downcase == 'y'
      student = Student.new(age, name, parent_permission)
      @persons.push(student)
    when 2
      puts 'Specialization'
      specialization = gets.chomp
      teacher = Teacher.new(age, specialization, name)
      @persons.push(teacher)
    end
    puts 'Person added successfully.'
  end

  def add_book
    puts 'Title'
    title = gets.chomp
    puts 'Author'
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book added successfully.'
  end

  def add_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not Id)'
    @persons.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    puts "Date"
    date = gets.chomp
    rental = Rental.new(date, @books[book_index], @persons[person_index])
    @rentals.push(rental)
    puts "Rental added sucessfully"
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
    puts "ID of person"
    person_id = gets.chomp
    puts "Rentals"
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

