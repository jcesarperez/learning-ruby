# Lesson 1: Basic Syntax and Duck Typing
# Implement the methods below to make the tests pass

def say_hello_to(name)
  "Hello, #{name}!"
end

def get_optional_hello(should_return)
  # Return 'hello' if should_return is true, nil otherwise
  should_return ? 'hello' : nil
end

def classify_type(symbol)
  # Return 'Administrator' for :admin, 'Regular User' for :user
  symbol == :admin ? 'Administrator' : 'Regular User'
end

def format_user(name, id)
  # Use string interpolation to return "User: #{name} (ID: #{id})"
  "User: #{name} (ID: #{id})"
end

def calculate_message(number_a, number_b)
  # Return a string like '10 + 5 = 15' using interpolation
  sum = number_a + number_b
  "#{number_a} + #{number_b} = #{sum}"
end

def add(number_a, number_b)
  # Return sum (implicit return, no 'return' keyword needed)
  number_a + number_b
end

def multiply(number_a, number_b)
  # Return product
  number_a * number_b
end

def even?(number)
  # Return true if number is even, false otherwise
  # Note the ? in method name - Ruby convention for boolean methods
  number.even?
end

def upcase!(text)
  # Modify the text object to uppercase using upcase!
  # Return the modified text
  text.upcase!
end

def repeat_action(number_times)
  result = []
  number_times.times { result << 'action' }
  result
end

def number_even?(number)
  # TODO: Call .even? method directly on the number
  # Yes, numbers have methods in Ruby!
  number.even?
end

def truthy?(value)
  # TODO: Return true if value is truthy, false if falsy
  # Only nil and false are falsy in Ruby
  # Hint: !!value converts to boolean
  !!value
end
