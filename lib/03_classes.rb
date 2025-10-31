# Lesson 3: Classes and OOP

class Person
  # TODO: Add attr_accessor for :name and :age to create getters/setters automatically
  
  def initialize(name, age)
    # TODO: Set instance variables @name and @age
  end

  def introduce
    # TODO: Return "Hi, I am #{@name} and I am #{@age} years old"
  end

  def birth_year
    # TODO: Calculate and return birth year (assume current year is 2025)
  end

  # Class methods (like static methods in Java)
  def self.species
    # TODO: Return 'Homo sapiens'
  end

  def self.create_anonymous
    # TODO: Return a new Person with name 'Anonymous' and age 0
    # Hint: Person.new('Anonymous', 0)
  end

  def public_info
    # TODO: Return "Public info: #{secret_code}"
    # This will call the private method
  end

  private

  def secret_code
    # TODO: Return 'This is a secret'
  end
end

class Employee < Person
  # TODO: Add attr_accessor for :title
  
  def initialize(name, age, title)
    # TODO: Call parent initialize with super(name, age)
    # Then set @title
  end

  def introduce
    # TODO: Call parent introduce with super, then add title info
    # Return something like "Hi, I am Frank and I am 40 years old. I work as a Engineer"
  end
end

class BankAccount
  # TODO: Add attr_reader for :id (read-only)
  # TODO: Add attr_writer for :password (write-only)
  # TODO: Add attr_accessor for :balance (read and write)
  
  def initialize(id, balance)
    # TODO: Set @id and @balance
  end
end

class Counter
  # TODO: Add attr_reader for :value
  
  def initialize
    # TODO: Set @value to 0
  end

  def increment
    # TODO: Increment @value by 1
    # Return self to allow method chaining
  end
end
