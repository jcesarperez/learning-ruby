# Lesson 2: Collections and Blocks

# Arrays
def create_array_of_names
  # TODO: Return an array with ['Alice', 'Bob', 'Charlie']
end

def get_first(array)
  # TODO: Return first element using array[0] or array.first
end

def get_last(array)
  # TODO: Return last element using array[-1] or array.last
end

def get_second_to_last(array)
  # TODO: Return second to last using negative index
end

def add_to_array(array, element)
  # TODO: Add element to array using << operator and return the array
end

# Hashes
def create_user_hash(name, age)
  # TODO: Return a hash with symbol keys: { name: name, age: age }
end

def get_value(hash, key)
  # TODO: Return the value for the given key
end

def merge_hashes(hash1, hash2)
  # TODO: Merge hash2 into hash1 and return the result
  # Hint: use .merge method
end

# Blocks and Iterators
def double_each_element(array)
  # TODO: Use .each to iterate and build new array with doubled values
  # Hint: result = []
  #       array.each { |n| result << n * 2 }
end

def square_numbers(array)
  # TODO: Use .map to square each number
end

def filter_evens(array)
  # TODO: Use .select to keep only even numbers
end

def find_first_greater_than(array, threshold)
  # TODO: Use .find to get first element greater than threshold
end

def sum_array(array)
  # TODO: Use .reduce to sum all numbers
  # Hint: array.reduce(0) { |sum, n| sum + n }
end

# Block Syntax
def transform_with_single_line(array)
  # TODO: Use {} syntax to double each number
  # array.map { |n| n * 2 }
end

def transform_with_multi_line(array)
  # TODO: Use do...end syntax to triple each number
  # array.map do |n|
  #   n * 3
  # end
end

# Method Chaining
def chain_operations(array)
  # TODO: Chain .select (get evens) then .map (square them)
  # array.select { |n| n.even? }.map { |n| n * n }
end

def get_squared_evens(array)
  # TODO: Filter evens, then square them
end

# Useful Methods
def contains_value?(array, value)
  # TODO: Use .include? to check if array contains value
end

def get_size(array)
  # TODO: Return array size using .length or .size
end

def is_empty?(array)
  # TODO: Use .empty? to check if array is empty
end
