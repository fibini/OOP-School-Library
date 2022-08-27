# Create a app.rb file that will serve as your console app entry-point. It should have methods that do the following:
#     List all books.
#     List all people.
#     Create a person (teacher or student, not a plain Person).
#     Create a book.
#     Create a rental.
#     List all rentals for a given person id

module App
  def list_all_books(books = [])
    if books.empty?
      puts 'No books found'
      puts
    else
      @books.each do |book|
        puts "Title: #{book.title}"
        puts "Author: #{book.author}"
        puts
      end
    end
  end

  def list_all_people(persons = [])
    if persons.empty?
      puts 'No people found'
      puts
    else
      @persons.each do |person|
        puts "Id: #{person.id}"
        puts "Name: #{person.name}"
        puts "Age: #{person.age}"
        puts
      end
    end
  end

  def show_rentals(rentals, id)
    if rentals.empty?
      puts 'No rentals!'
      puts
    else
      rentals.each do |rental|
        next unless rental.person.id == id

        puts "Date: #{rental.date}"
        puts "Book: #{rental.book.title}, by #{rental.book.author}"
        puts "Person: #{rental.person.name}"
        puts
      end
    end
  end

  def create_a_book(books, book)
    books.push(book)
  end

  def create_a_person(persons, person)
    persons.push(person)
  end

  def create_a_rental(rentals, rental)
    rentals.push(rental)
  end
end
