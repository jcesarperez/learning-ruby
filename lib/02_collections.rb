# Lesson 2: Collections and Blocks

# Arrays
def create_array_of_names
  # Return an array with ['Alice', 'Bob', 'Charlie']
  %w[Alice Bob Charlie]
end

def get_first(array)
  # Return first element using array[0] or array.first
  array[0]
end

def get_last(array)
  # Return last element using array[-1] or array.last
  array[-1]
end

def get_second_to_last(array)
  # Return second to last using negative index
  array[-2]
end

def add_to_array(array, element)
  # Add element to array using << operator and return the array
  array << element
end

# Hashes
def create_user_hash(name, age)
  # Return a hash with symbol keys: { name: name, age: age }
  { name: name, age: age }
end

def get_value(hash, key)
  # Return the value for the given key
  hash[key]
end

def merge_hashes(hash1, hash2)
  # Merge hash2 into hash1 and return the result
  # Hint: use .merge method
  hash1.merge(hash2)
end

# Blocks and Iterators
def double_each_element(array)
  # Use .each to iterate and build new array with doubled values
  # Hint: result = []
  #       array.each { |n| result << n * 2 }
  result = []
  array.each { |n| result << (n * 2) }
  result
end

def square_numbers(array)
  # Use .map to square each number
  array.map { |n| n * n }
end

def filter_evens(array)
  # Use .select to keep only even numbers
  # array.select { |n| n.even? }
  array.select(&:even?)
end

def find_first_greater_than(array, threshold)
  # Use .find to get first element greater than threshold
  array.find { |n| n > threshold }
end

def sum_array(array)
  # Use .reduce to sum all numbers
  # Hint: array.reduce(0) { |sum, n| sum + n }
  array.reduce(0) { |sum, n| sum + n }
end

# Block Syntax
def transform_with_single_line(array)
  # Use {} syntax to double each number
  # array.map { |n| n * 2 }
  array.map { |n| n * 2 }
end

def transform_with_multi_line(array)
  # Use do...end syntax to triple each number
  # array.map do |n|
  #   n * 3
  # end
  array.map do |n|
    n * 3
  end
end

# Method Chaining
def chain_operations(array)
  # Chain .select (get evens) then .map (square them)
  # array.select { |n| n.even? }.map { |n| n * n }
  array.select { |n| n.even? }.map { |n| n * n }
end

def get_squared_evens(array)
  # Filter evens, then square them
  array.select { |n| n.even? }.map { |n| n * n }
end

# Useful Methods
def contains_value?(array, value)
  # Use .include? to check if array contains value
  array.include?(value)
end

def get_size(array)
  # Return array size using .length or .size
  array.size
end

def is_empty?(array)
  # Use .empty? to check if array is empty
  array.empty?
end
