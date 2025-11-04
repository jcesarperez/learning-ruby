# Lesson 1 Extension: More Syntax and Control
# Implement the methods below to make the tests pass

# ===== Conditional Modifiers =====
def greet_if_adult(age)
  # Return 'Welcome!' if age >= 18, otherwise return nil
  # Use statement modifier: 'Welcome!' if age >= 18
  'Welcome!' if age >= 18
end

def reject_unless_valid(email)
  # Return 'Invalid email' unless email contains '@'
  # Use unless modifier
  'Invalid email' unless email.include?('@')
end

# ===== Case/When =====
def classify_grade(score)
  # Use case/when to return:
  # 90..100 -> 'A'
  # 80..89 -> 'B'
  # 70..79 -> 'C'
  # 0..69 -> 'F'
  case score
  when 90..100
    'A'
  when 80..89
    'B'
  when 70..79
    'C'
  when 0..69
    'F'
  else
    'error'
  end
end

def process_command(command)
  # Use case/when with symbols
  # :start -> 'Starting...'
  # :stop -> 'Stopping...'
  # :pause -> 'Pausing...'
  # else -> 'Unknown command'
  case command
  when :start
    'Starting...'
  when :stop
    'Stopping...'
  when :pause
    'Pausing...'
  else
    'Unknown command'
  end
end

# ===== Ranges =====
def inclusive_range
  # Return range 1..5 (includes 5)
  1..5
end

def exclusive_range
  # Return range 1...5 (excludes 5)
  1...5
end

def number_in_range?(number, min, max)
  # Check if number is in range min..max using case/when
  # case number
  # when min..max
  #   true
  # else
  #   false
  # end
  case number
  when min..max
    true
  else
    false
  end
end

def range_to_array(start, finish)
  # Convert range start..finish to array
  # Hint: (start..finish).to_a
  (start..finish).to_a
end

# ===== Loops =====
def count_until(limit)
  # Use until loop to count from 0 to limit (exclusive)
  # Return array of numbers
  result = []
  i = 0
  until i >= limit
    result << i
    i += 1
  end
  result
end

def skip_evens(limit)
  # Use while loop with next to skip even numbers
  # Return array of odd numbers from 1 to limit
  result = []
  i = 0
  while i < limit
    i += 1
    next if i.even?

    result << i
  end
  result
end

def loop_with_break(array)
  # Use loop do...end to find first element > 5
  # Use break to exit loop
  i = 0
  result = 0
  loop do
    result = array[i]
    break if result > 5

    i += 1
  end
  result
end

# ===== Safe Navigation =====
def safe_upcase(text)
  # Use &. to safely call upcase on text (might be nil)
  # Return nil if text is nil, otherwise return upcased text
  text&.upcase
end

def get_user_name(user_hash)
  # Safely get user_hash[:profile][:name]
  # Use &.[] or &.dig to handle nil values
  user_hash[:profile]&.dig(:name)
end

# ===== Logical Operators =====
def both_conditions?(a, b)
  # Return true if both a > 0 and b > 0
  # Use 'and' operator (note: different precedence than &&)
  a > 0 and b > 0
end

def either_condition?(a, b)
  # Return true if a > 10 or b > 10
  # Use 'or' operator
  a > 10 or b > 10
end

def try_action
  yield
  true
rescue StandardError
  false
end
