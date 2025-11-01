require 'spec_helper'
require_relative '../lib/02_collections'

RSpec.describe 'Lesson 2: Collections and Blocks' do
  describe 'Arrays' do
    it 'creates arrays without specifying ArrayList' do
      # In Java: List<String> names = new ArrayList<>();
      # In Ruby: names = []
      result = create_array_of_names
      expect(result).to eq(%w[Alice Bob Charlie])
    end

    it 'accesses elements with [] and supports negative indices' do
      # Negative indices count from the end
      arr = %w[a b c d e]
      expect(get_first(arr)).to eq('a')
      expect(get_last(arr)).to eq('e')
      expect(get_second_to_last(arr)).to eq('d')
    end

    it 'adds elements with << (shovel operator)' do
      result = add_to_array([1, 2], 3)
      expect(result).to eq([1, 2, 3])
    end
  end

  describe 'Hashes' do
    it 'creates hashes (like HashMap but cleaner)' do
      # In Java: Map<String, Integer> ages = new HashMap<>();
      # In Ruby: ages = {}
      result = create_user_hash('Alice', 30)
      expect(result).to eq({ name: 'Alice', age: 30 })
    end

    it 'uses symbols as keys (more efficient than strings)' do
      hash = { name: 'Bob', age: 25 }
      expect(get_value(hash, :name)).to eq('Bob')
      expect(get_value(hash, :age)).to eq(25)
    end

    it 'can merge hashes' do
      hash1 = { a: 1, b: 2 }
      hash2 = { c: 3, d: 4 }
      result = merge_hashes(hash1, hash2)
      expect(result).to eq({ a: 1, b: 2, c: 3, d: 4 })
    end
  end

  describe 'Blocks and Iterators' do
    it 'uses .each instead of for loops' do
      # In Java: for(String item : list) { ... }
      # In Ruby: list.each { |item| ... }
      result = double_each_element([1, 2, 3])
      expect(result).to eq([2, 4, 6])
    end

    it 'uses .map to transform collections' do
      # In Java: list.stream().map(x -> x * 2).collect(Collectors.toList())
      # In Ruby: list.map { |x| x * 2 }
      result = square_numbers([1, 2, 3, 4])
      expect(result).to eq([1, 4, 9, 16])
    end

    it 'uses .select to filter collections' do
      # In Java: list.stream().filter(x -> x > 3).collect(Collectors.toList())
      # In Ruby: list.select { |x| x > 3 }
      result = filter_evens([1, 2, 3, 4, 5, 6])
      expect(result).to eq([2, 4, 6])
    end

    it 'uses .find to get first matching element' do
      # In Java: list.stream().filter(x -> x > 3).findFirst()
      # In Ruby: list.find { |x| x > 3 }
      result = find_first_greater_than([1, 2, 5, 3, 7], 4)
      expect(result).to eq(5)
    end

    it 'uses .reduce for aggregation' do
      # In Java: list.stream().reduce(0, (a, b) -> a + b)
      # In Ruby: list.reduce(0) { |sum, n| sum + n }
      result = sum_array([1, 2, 3, 4, 5])
      expect(result).to eq(15)
    end
  end

  describe 'Block Syntax' do
    it 'uses {} for single-line blocks' do
      # Convention: use {} for single line
      result = transform_with_single_line([1, 2, 3])
      expect(result).to eq([2, 4, 6])
    end

    it 'uses do...end for multi-line blocks' do
      # Convention: use do...end for multiple lines
      result = transform_with_multi_line([1, 2, 3])
      expect(result).to eq([3, 6, 9])
    end
  end

  describe 'Method Chaining' do
    it 'chains multiple operations fluently' do
      # Much cleaner than Java streams
      result = chain_operations([1, 2, 3, 4, 5, 6])
      expect(result).to eq([4, 16, 36])
    end

    it 'combines map and select' do
      result = get_squared_evens([1, 2, 3, 4, 5])
      expect(result).to eq([4, 16])
    end
  end

  describe 'Useful Array Methods' do
    it 'checks inclusion with .include?' do
      # In Java: list.contains(element)
      # In Ruby: list.include?(element)
      expect(contains_value?([1, 2, 3], 2)).to be true
      expect(contains_value?([1, 2, 3], 5)).to be false
    end

    it 'gets array size with .length or .size' do
      expect(get_size([1, 2, 3, 4])).to eq(4)
    end

    it 'checks if empty with .empty?' do
      expect(is_empty?([])).to be true
      expect(is_empty?([1])).to be false
    end
  end
end
