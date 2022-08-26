# Create a app.rb file that will serve as your console app entry-point. It should have methods that do the following:
#     List all books.
#     List all people.
#     Create a person (teacher or student, not a plain Person).
#     Create a book.
#     Create a rental.
#     List all rentals for a given person id

module App
  def create_book(title, author)
    print "Title:"
    title = gets.chomp
    print "Author:"
    author = gets.chomp
  end
end
