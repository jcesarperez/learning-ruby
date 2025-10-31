# Lesson 5: Exception Handling

# Custom Exceptions
class InvalidEmailError < StandardError
end

class InsufficientFundsError < StandardError
  def initialize(account_name)
    # TODO: Call super with message "Insufficient funds for account: #{account_name}"
  end
end

# Basic Exception Handling
def safe_divide(a, b)
  # TODO: Use begin/rescue to catch ZeroDivisionError
  # Return the result of a / b
  # If ZeroDivisionError occurs, return 'Cannot divide by zero'
end

def parse_number(string)
  # TODO: Use begin/rescue to catch ArgumentError
  # Use Integer(string) to parse (raises ArgumentError if invalid)
  # Return the parsed number
  # If ArgumentError occurs, return 'Not a valid number'
end

# Raising Exceptions
def validate_age(age)
  # TODO: Raise ArgumentError with message 'Age cannot be negative' if age < 0
  # Otherwise return age
end

def validate_email(email)
  # TODO: Raise InvalidEmailError if email doesn't contain '@'
  # Otherwise return email
  # Hint: raise InvalidEmailError unless email.include?('@')
end

# Ensure (like finally)
def read_file_safely(filename)
  # TODO: Use begin/ensure to simulate file operations
  # In begin: return "Reading #{filename}"
  # In ensure: add " and file closed" to the return value
  # Hint: Use a variable to build the result
  result = "Reading #{filename}"
  # Add ensure block that appends " and file closed"
end

# Inline rescue
def risky_operation_safe
  # TODO: Call risky_operation and rescue any StandardError
  # Don't use begin/end, just rescue at method level
  # Return 'Operation completed safely' if error occurs
end

def risky_operation
  # This will raise an error
  raise StandardError, 'Something went wrong'
end

def get_value_with_default
  # TODO: Use inline rescue to return 'default' if risky_call fails
  # risky_call rescue 'default'
end

def risky_call
  raise StandardError, 'Failed'
end

# Multiple rescue clauses
def process_input(input)
  # TODO: Handle different exceptions
  # If input == 'zero_error', do 1/0
  # If input == 'type_error', do input + 123
  # If input == 'other_error', raise StandardError
  # Otherwise return "Processed: #{input}"
  #
  # Rescue ZeroDivisionError: return 'Handled division by zero'
  # Rescue TypeError: return 'Handled type error'
  # Rescue StandardError: return 'Handled unexpected error'
end

# Retry
def unreliable_operation
  # TODO: Implement a method that uses retry
  # Use a counter (@@attempt_count or similar)
  # Raise an error on first attempt, succeed on second
  # Hint: define a class variable or use a closure
  @attempts ||= 0
  @attempts += 1
  
  # TODO: raise StandardError if @attempts == 1
  # Otherwise return 'Success after retry'
end

# Note: For a real retry example, you'd typically do:
# def method_with_retry
#   attempts = 0
#   begin
#     attempts += 1
#     # risky operation
#     raise 'Error' if attempts == 1
#   rescue StandardError
#     retry if attempts < 2
#     raise
#   end
# end
