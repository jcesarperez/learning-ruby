# Lesson 2 Extension: Advanced Collections and Blocks

# ===== Advanced Array Methods =====
def zip_arrays(array1, array2)
  # Use .zip to combine two arrays into array of pairs
  # [1,2,3].zip(['a','b','c']) => [[1,'a'], [2,'b'], [3,'c']]
  # array1.zip(array2)
  array1.zip(array2)
end

def flatten_nested(nested_array)
  # Flatten nested arrays into single level
  # [[1,2], [3,[4,5]]] => [1,2,3,4,5]
  # nested_array.flatten
  nested_array.flatten
end

def remove_nils(array)
  # Remove nil values using .compact
  # [1, nil, 2, nil, 3] => [1, 2, 3]
  # array.compact
  array.compact
end

def unique_elements(array)
  # Remove duplicates using .uniq
  # [1, 2, 2, 3, 3, 3] => [1, 2, 3]
  # array.uniq
  array.uniq
end

def partition_evens_odds(array)
  # Use .partition to split into [evens, odds]
  # Returns array with two arrays: [[evens], [odds]]
  # array.partition { |n| n.even? }
  array.partition { |n| n.even? }
end

# ===== Predicate Methods =====
def all_positive?(array)
  # Check if all elements are positive using .all?
  # array.all? { |n| n > 0 }
  array.all? { |n| n > 0 }
end

def any_negative?(array)
  # Check if any element is negative using .any?
  # array.any? { |n| n < 0 }
  # array.any? { |n| n.negative? }
  array.any?(&:negative?)
end

def none_zero?(array)
  # Check if no element is zero using .none?
  # array.none?(&:zero?)
  # array.none? { |n| n == 0 }
  array.none? { |n| n.zero? }
end

# ===== Take and Drop =====
def first_three(array)
  # Get first 3 elements using .first(3) or .take(3)
  # array.first(3)
  array.take(3)
end

def skip_first_two(array)
  # Skip first 2 elements using .drop(2)
  # array.drop(2)
  array.drop(2)
end

def take_while_small(array)
  # Take elements while they are less than 5
  # [1, 2, 6, 3, 7] => [1, 2]
  # array.take_while { |n| n < 5 }
  array.take_while { |n| n < 5 }
end

# ===== Advanced Hash Methods =====
def fetch_with_default(hash, key, default)
  # Use .fetch to get value or return default if key doesn't exist
  # Unlike hash[key], fetch raises error without default
  # hash.fetch(key, default)
  hash.fetch(key, default)
end

def deep_fetch(hash, *keys)
  # Use .dig to safely access nested hash values
  # hash.dig(:user, :profile, :name)
  # hash.dig(*keys)
  hash.dig(*keys)
end

def uppercase_keys(hash)
  # Transform all keys to uppercase symbols
  # { name: 'Alice' } => { NAME: 'Alice' }
  # hash.transform_keys { |k| k.to_s.upcase.to_sym }
  hash.transform_keys { |k| k.to_s.upcase.to_sym }
end

def double_values(hash)
  # Double all numeric values in hash
  # { a: 1, b: 2 } => { a: 2, b: 4 }
  # hash.transform_values { |v| v * 2 }
  hash.transform_values { |v| v * 2 }
end

def filter_hash(hash)
  # Keep only entries where value > 5 using .select
  # { a: 3, b: 7, c: 9 } => { b: 7, c: 9 }
  # hash.select { |k, v| v > 5 }
  hash.select { |_k, v| v > 5 }
end

def reject_nils_from_hash(hash)
  # Remove entries with nil values using .reject or .compact
  # { a: 1, b: nil, c: 3 } => { a: 1, c: 3 }
  # hash.reject { |k, v| v.nil? } or hash.compact
  hash.reject { |_k, v| v.nil? }
end

# ===== Blocks with Index =====
def map_with_positions(array)
  # Use .map.with_index to create "element at position X"
  # ['a', 'b', 'c'] => ['a at 0', 'b at 1', 'c at 2']
  # array.map.with_index { |item, i| "#{item} at #{i}" }
  array.map.with_index { |item, i| "#{item} at #{i}" }
end

def each_with_index_demo(array)
  # Use .each_with_index to build hash with index as key
  # ['a', 'b', 'c'] => { 0 => 'a', 1 => 'b', 2 => 'c' }
  # result = {}
  # array.each_with_index { |item, i| result[i] = item }
  result = {}
  array.each_with_index { |item, i| result[i] = item }
  result
end

# ===== Group By =====
def group_by_length(words)
  # Group words by their length
  # ['a', 'bb', 'ccc', 'dd'] => { 1 => ['a'], 2 => ['bb', 'dd'], 3 => ['ccc'] }
  # words.group_by { |word| word.length }
  words.group_by { |w| w.length }
end

def group_by_even_odd(numbers)
  # Group numbers by :even or :odd
  # [1, 2, 3, 4] => { odd: [1, 3], even: [2, 4] }
  # numbers.group_by { |n| n.even? ? :even : :odd }
  numbers.group_by { |n| n.even? ? :even : :odd }
end

# ===== Inject (alternative to reduce) =====
def product_of_array(array)
  # Use .inject to multiply all numbers
  # [2, 3, 4] => 24
  # TODO: array.inject(1) { |product, n| product * n }
  # Or: array.inject(:*)
  # array.inject(1) { |total, n| total * n }
  array.inject(:*)
end

def build_hash_from_array(array)
  # Use inject to build hash where key is element, value is its square
  # [1, 2, 3] => { 1 => 1, 2 => 4, 3 => 9 }
  # array.inject({}) { |hash, n| hash.merge(n => n * n) }
  array.inject({}) { |hash, n| hash.merge(n => n * n) }
end

# ===== Min, Max, Sort =====
def find_longest_word(words)
  # Find longest word using .max_by
  # ['a', 'bbb', 'cc'] => 'bbb'
  # words.max_by { |word| word.length }
  words.max_by { |w| w.length }
end

def find_smallest_number(array)
  # Find smallest using .min
  # array.min
  array.min
end

def sort_by_length(words)
  # Sort words by length using .sort_by
  # ['ccc', 'a', 'bb'] => ['a', 'bb', 'ccc']
  # words.sort_by { |word| word.length }
  words.sort_by { |w| w.length }
end

# ===== Splat Operators =====
def first_and_rest(array)
  # Use array destructuring to get first element and rest
  # [1, 2, 3, 4] => [1, [2, 3, 4]]
  # first, *rest = array
  #       [first, rest]
  first, *rest = array
  [first, rest]
end

def combine_arrays(*arrays)
  # Accept variable number of arrays and flatten them
  # combine_arrays([1,2], [3,4], [5,6]) => [1,2,3,4,5,6]
  # arrays.flatten
  arrays.flatten
end

def merge_multiple_hashes(**hashes)
  # Accept variable keyword arguments and merge them
  # hashes
  hashes.merge
end

# ===== Lazy Evaluation =====
def first_5_evens_from_infinite
  # Use .lazy to work with infinite range efficiently
  # Get first 5 even numbers from 1 to infinity
  # (1..Float::INFINITY).lazy.select(&:even?).first(5)
  (1..Float::INFINITY).lazy.select(&:even?).first(5)
end

def lazy_map_and_take(range, limit)
  # Use lazy to avoid processing entire range
  # Double each number but only take first 'limit' results
  # range.lazy.map { |n| n * 2 }.take(limit).to_a
  range.lazy.map { |n| n * 2 }.take(limit).to_a
end

# ===== Blocks with Multiple Parameters =====
def hash_each_demo(hash)
  # Iterate hash with .each receiving key and value
  # Return array of "key: value" strings
  # hash.map { |key, value| "#{key}: #{value}" }
  hash.map { |key, value| "#{key}: #{value}" }
end

def zip_with_index(array)
  # Combine array with its indices using .zip
  # ['a', 'b', 'c'] => [['a', 0], ['b', 1], ['c', 2]]
  # array.zip((0...array.length).to_a)
  # Or: array.map.with_index { |item, i| [item, i] }
  array.zip((0...array.length).to_a)
end

# ===== Chunk and Slice =====
def chunk_by_size(array)
  # Split array into chunks of 2 elements using .each_slice
  # [1, 2, 3, 4, 5] => [[1, 2], [3, 4], [5]]
  # array.each_slice(2).to_a
  array.each_slice(2).to_a
end

def chunk_consecutive(array)
  # Group consecutive numbers using .chunk
  # [1, 2, 4, 5, 6, 8] => [[1, 2], [4, 5, 6], [8]]
  # array.chunk_while { |i, j| j == i + 1 }.to_a
  array.chunk_while { |i, j| j == i + 1 }.to_a
end
