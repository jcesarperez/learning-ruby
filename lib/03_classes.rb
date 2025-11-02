# Lesson 3: Classes and OOP

class Person
  # Add attr_accessor for :name and :age to create getters/setters automatically
  attr_accessor :name, :age

  def initialize(name, age)
    # Set instance variables @name and @age
    @name = name
    @age = age
  end

  def introduce
    # Return "Hi, I am #{@name} and I am #{@age} years old"
    "Hi, I am #{@name} and I am #{@age} years old"
  end

  def birth_year
    # Calculate and return birth year (assume current year is 2025)
    2025 - @age
  end

  # Class methods (like static methods in Java)
  def self.species
    # Return 'Homo sapiens'
    'Homo sapiens'
  end

  def self.create_anonymous
    # Return a new Person with name 'Anonymous' and age 0
    # Hint: Person.new('Anonymous', 0)
    Person.new('Anonymous', 0)
  end

  def public_info
    # Return "Public info: #{secret_code}"
    # This will call the private method
    "Public info: #{secret_code}"
  end

  private

  def secret_code
    # Return 'This is a secret'
    'This is a secret'
  end
end

class Employee < Person
  # Add attr_accessor for :title
  attr_accessor :title

  def initialize(name, age, title)
    # Call parent initialize with super(name, age)
    # Then set @title
    super(name, age)
    @title = title
  end

  def introduce
    # Call parent introduce with super, then add title info
    # Return something like "Hi, I am Frank and I am 40 years old. I work as a Engineer"
    "#{super}. I work as a #{@title}"
  end
end

class BankAccount
  # Add attr_reader for :id (read-only)
  # Add attr_writer for :password (write-only)
  # Add attr_accessor for :balance (read and write)
  attr_reader :id
  attr_writer :password
  attr_accessor :balance

  def initialize(id, balance)
    # Set @id and @balance
    @id = id
    @balance = balance
  end
end

class Counter
  # Add attr_reader for :value
  attr_reader :value

  def initialize
    # Set @value to 0
    @value = 0
  end

  def increment
    # Increment @value by 1
    # Return self to allow method chaining
    @value += 1
    self
  end
end
