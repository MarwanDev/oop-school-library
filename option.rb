module Option
  def choose_option(option, app)
    case option
    when 1
      app.list_all_books
    when 2
      app.list_all_people
    when 3
      app.add_person
    when 4
      app.add_book
    when 5
      app.add_rental
    when 6
      app.list_rentals
    else
      puts 'Try again by choosing option 1-7'
    end
  end
end
