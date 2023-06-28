require 'json'
require_relative 'book'
require_relative 'person'
require_relative 'rental'

def write(file_name, obj)
  content = obj
  File.write(file_name, JSON.generate(content, { max_nesting: false }))
end

module ReadData
  def read_books
    books = []
    if !File.exist?('Data Files/books.json') || (File.exist?('Data Files/books.json') && File.empty?('Data Files/books.json'))
      []
    else
      JSON.parse(File.read('Data Files/books.json')).map do |book|
        books.push(Book.new(book['title'], book['author']))
      end
    end
    books
  end

  def read_people
    people = []
    if !File.exist?('Data Files/people.json') || (File.exist?('Data Files/people.json') && File.empty?('Data Files/people.json'))
      []
    else
      JSON.parse(File.read('Data Files/people.json')).map do |person|
        people.push(Person.new(person['id'], person['name'], person['age'], person['type']))
      end
    end
    people
  end

  def read_rentals
    rentals = []
    if !File.exist?('Data Files/rentals.json') || (File.exist?('Data Files/rentals.json') && File.empty?('Data Files/rentals.json'))
      []
    else
      JSON.parse(File.read('Data Files/rentals.json')).map do |rental|
        rentals.push(Rental.new(rental['date'], rental['person'], rental['book']))
      end
    end
    rentals
  end
end

def read(file_name)
  if !File.exist?(file_name) || (File.exist?(file_name) && File.empty?(file_name))
    []
  else
    JSON.parse(File.read(file_name))
  end
end
