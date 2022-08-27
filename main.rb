#!/usr/bin/env ruby

# Present the user with a list of options to perform.
# Lets users choose an option.
# If needed, ask for parameters for the option.
# Have a way to quit the app.
require 'pry'
require './app'
require './book'
require './student'
require './teacher'
require './rental'

class Main
  include App

  def initialize
    @persons = []
    @books = []
    @rentals = []
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
    option = gets.chomp.to_i
    run_options(option)
    puts 'Invalid option' if option > 7
  end

  def run_options(option)
    case option
    when 1
      list_all_books(@books)
      main
    when 2
      list_all_people(@persons)
      main

    when 6
      show_all_rentals
      main
    when 7
      puts 'Goodbye'
      puts
    else
      add(option)
    end
  end

  def add(opton)
    case option
    when 4
      create_book
      main
    when 5
      create_rental
      main
    when 3
      option_three
      main
    end
    binding.pry
  end

  def option_three
    puts 'Do you want to create a student (1) or teacher (2) [Input number]:'
    num = gets.chomp.to_i
    case num
    when 1
      student
    when 2
      teacher
    else
      puts 'Invalid selection'
    end
  end

  def student()
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Classroom:'
    classroom = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp
    create_a_person(@persons, Student.new(classroom, name, age, parent_permission: parent_permission))
    puts 'Student created successfully'
    puts
    main
  end

  def teacher()
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    create_a_person(@persons, Teacher.new(specialization, name, age))
    puts 'Teacher created successfully'
    puts
    main
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    create_a_book(@books, Book.new(title, author))
    puts 'Book created successfully'
    puts
    main
  end

  def create_rental
    if @books.empty? || @persons.empty?
      puts 'Cannot create rental. Must add 1 person and 1 book'
      main
    else
      puts 'Select a book from the following list by number'
      @books.each_with_index do |book, index|
        puts "#{index}. #{book.title}, #{book.author}"
      end
      book = gets.chomp.to_i
      puts 'Select a person from the following list by number(not id)'
      @persons.each_with_index do |person, index|
        puts "#{index}. #{person.name}, #{person.age}, #{person.id}"
      end
      person = gets.chomp.to_i
      print 'Date: '
      date = gets.chomp
      create_a_rental(@rentals, Rental.new(date, @books[book], @persons[person]))
      puts 'Rental created successfully'
      puts
    end
  end

  def show_all_rentals
    if @rentals.empty?
      puts 'No Rentals'
    else
      puts 'ID of person'
      @persons.each_with_index { |person, index| puts "#{index}: #{person.name}" }
      id = gets.chomp.to_i
      show_rentals(@rentals, id)
    end
  end
end

Main.new.main
