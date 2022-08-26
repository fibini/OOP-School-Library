#!/usr/bin/env ruby

# Present the user with a list of options to perform.
# Lets users choose an option.
# If needed, ask for parameters for the option.
# Have a way to quit the app.
require './app'

class Main
    include App
    def initialize()
    end

  def main
    puts 'Welcome to School Library App!'
    puts
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    option = gets.chomp
    run_options(option)
    option_three(option)
    puts 'Invalid option' if option > '7'
  end

  def run_options(option)
    case option
    when '1'
      list_all_books()
      main
    when '2'
      list_all_people(@people)
      main
    when '4'
        create_book(title, author)
      main
    when '5'
      puts 'Select a book from the following list by number'
      main
    when '6'
      show_rentals(@rental)
      main
    when '7'
      puts 'Goodbye'
    end
  end

  def option_three(option)
    case option
    when '3'
      puts 'Do you want to create a student (1) or teacher (2) [Input number]:'
      num = gets.chomp
      case num
      when '1'
        puts 'create student'
        main
      when '2'
        puts 'create teacher'
        main
      else
        puts 'Invalid selection'
      end
    end
  end
end
Main.new.main
