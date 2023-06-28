require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'rental'
require_relative 'classroom'
require_relative 'teacher'
require_relative 'input'
require_relative 'file_manager'
require 'json'

class App
  attr_accessor :books, :persons, :classroom, :rentals

  include ReadData
  def initialize
    @books = read_books
    @persons = read('Data Files/people.json')
    @rentals = read('Data Files/rentals.json')
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
      type = 'Student'
      student = Student.new(type, parent_permission, name, age)
      @persons.push(student)
    when 2
      puts 'Specialization'
      specialization = Input.new.input
      type = 'Teacher'
      teacher = Teacher.new(type, specialization, name, age)
      @persons.push(teacher)
    end
    write('Data Files/people.json', @persons)
  end

  def add_book
    puts 'Title'
    title = Input.new.input
    puts 'Author'
    author = Input.new.input
    book = Book.new(title, author)
    @books.push(book)
    write('Data Files/books.json', @books)
    puts 'Book added successfully.'
  end

  def add_rental
    puts 'Select a book from the following list by number'
    @books = read('Data Files/books.json')
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book['title']}, Author: #{book['author']}"
    end
    book_index = Input.new.input_int
    puts 'Select a person from the following list by number (not Id)'
    @persons = read('Data Files/people.json')
    @persons.each_with_index do |person, index|
      puts "#{index}) Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
    end
    person_index = Input.new.input_int
    puts 'Date'
    date = Input.new.input
    rental = Rental.new(date, @books[book_index], @persons[person_index])
    @rentals.push(rental)
    write('Data Files/rentals.json', @rentals)
    puts 'Rental added sucessfully'
  end

  def list_all_people
    @persons = read('Data Files/people.json')
    @persons.each do |person|
      puts "[#{person['type']}], ID: #{person['id']}, Name: #{person['name']}, age: #{person['age']}"
    end
  end

  def list_rentals
    puts 'ID of person'
    person_id = Input.new.input
    puts 'Rentals'
    @rentals = read('Data Files/rentals.json')
    @rentals.each do |rental|
      puts "Date: #{rental['date']}, Book: '#{rental['book']['title']}' by #{rental['book']['author']}" if rental['person']['id'] == person_id
    end
  end

  def list_all_books
    @books = read('Data Files/books.json')
    @books.each do |book|
      puts "Title: '#{book['title']}', Author: #{book['author']}"
    end
  end
end
