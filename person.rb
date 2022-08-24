require './nameable'
require './decorator'
require './capitalizeDecorator'
require './trimmerDecorator'
require './rental'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rental

  def initialize(age, name = 'Unknown', parent_permission: true)
    super
    @name = name
    @id = id
    @age = age
    @parent_permission = parent_permission
    @rental = []
  end

  def can_use_services?
    @parent_permission || of_age?
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end
