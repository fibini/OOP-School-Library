class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @name = name
    @id = id
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    if parent_permission || of_age?
      puts true
    else
      puts false
    end
  end

  private

  def of_age?
    if @age >= 18
      puts true
    else
      puts false
    end
  end
end
