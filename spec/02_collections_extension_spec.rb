require 'spec_helper'
require_relative '../lib/02_collections_extension'

RSpec.describe 'Lesson 2 Extension: Advanced Collections' do
  describe 'Advanced Array Methods' do
    it 'zips two arrays together' do
      # In Java: need manual loop or IntStream.range
      # In Ruby: just .zip
      result = zip_arrays([1, 2, 3], %w[a b c])
      expect(result).to eq([[1, 'a'], [2, 'b'], [3, 'c']])
    end

    it 'flattens nested arrays' do
      nested = [[1, 2], [3, [4, 5]], 6]
      result = flatten_nested(nested)
      expect(result).to eq([1, 2, 3, 4, 5, 6])
    end

    it 'removes nil values with compact' do
      result = remove_nils([1, nil, 2, nil, 3, nil])
      expect(result).to eq([1, 2, 3])
    end

    it 'removes duplicates with uniq' do
      result = unique_elements([1, 2, 2, 3, 3, 3, 4])
      expect(result).to eq([1, 2, 3, 4])
    end

    it 'partitions array into two arrays' do
      # In Java: need to filter twice or manual loop
      # In Ruby: one call to .partition
      result = partition_evens_odds([1, 2, 3, 4, 5, 6])
      expect(result).to eq([[2, 4, 6], [1, 3, 5]])
    end
  end

  describe 'Predicate Methods (any?, all?, none?)' do
    it 'checks if all elements match condition' do
      # In Java: stream().allMatch()
      # In Ruby: .all?
      expect(all_positive?([1, 2, 3, 4])).to be true
      expect(all_positive?([1, -2, 3])).to be false
    end

    it 'checks if any element matches condition' do
      # In Java: stream().anyMatch()
      # In Ruby: .any?
      expect(any_negative?([1, 2, -3, 4])).to be true
      expect(any_negative?([1, 2, 3])).to be false
    end

    it 'checks if no element matches condition' do
      # In Java: stream().noneMatch()
      # In Ruby: .none?
      expect(none_zero?([1, 2, 3, 4])).to be true
      expect(none_zero?([1, 0, 3])).to be false
    end
  end

  describe 'Take and Drop' do
    it 'takes first N elements' do
      result = first_three([1, 2, 3, 4, 5])
      expect(result).to eq([1, 2, 3])
    end

    it 'drops first N elements' do
      result = skip_first_two([1, 2, 3, 4, 5])
      expect(result).to eq([3, 4, 5])
    end

    it 'takes elements while condition is true' do
      # Stops at first element that doesn't match
      result = take_while_small([1, 2, 6, 3, 7])
      expect(result).to eq([1, 2])
    end
  end

  describe 'Advanced Hash Methods' do
    it 'fetches with default value' do
      hash = { name: 'Alice', age: 30 }
      expect(fetch_with_default(hash, :name, 'Unknown')).to eq('Alice')
      expect(fetch_with_default(hash, :city, 'Unknown')).to eq('Unknown')
    end

    it 'digs into nested hashes safely' do
      # In Java: need multiple null checks
      # In Ruby: .dig handles everything
      hash = { user: { profile: { name: 'Bob' } } }
      expect(deep_fetch(hash, :user, :profile, :name)).to eq('Bob')
      expect(deep_fetch(hash, :user, :settings, :theme)).to be_nil
    end

    it 'transforms all keys' do
      hash = { name: 'Alice', age: 30 }
      result = uppercase_keys(hash)
      expect(result).to eq({ NAME: 'Alice', AGE: 30 })
    end

    it 'transforms all values' do
      hash = { a: 1, b: 2, c: 3 }
      result = double_values(hash)
      expect(result).to eq({ a: 2, b: 4, c: 6 })
    end

    it 'filters hash entries with select' do
      # In Java: need to stream entries, filter, collect
      # In Ruby: just .select
      hash = { a: 3, b: 7, c: 9, d: 2 }
      result = filter_hash(hash)
      expect(result).to eq({ b: 7, c: 9 })
    end

    it 'removes nil values from hash' do
      hash = { a: 1, b: nil, c: 3, d: nil }
      result = reject_nils_from_hash(hash)
      expect(result).to eq({ a: 1, c: 3 })
    end
  end

  describe 'Blocks with Index' do
    it 'maps with index' do
      # In Java: need IntStream.range or counter variable
      # In Ruby: .map.with_index
      result = map_with_positions(%w[a b c])
      expect(result).to eq(['a at 0', 'b at 1', 'c at 2'])
    end

    it 'iterates with each_with_index' do
      result = each_with_index_demo(%w[a b c])
      expect(result).to eq({ 0 => 'a', 1 => 'b', 2 => 'c' })
    end
  end

  describe 'Group By' do
    it 'groups elements by a property' do
      # In Java: Collectors.groupingBy()
      # In Ruby: .group_by (much simpler)
      result = group_by_length(%w[a bb ccc dd e])
      expect(result).to eq({ 1 => %w[a e], 2 => %w[bb dd], 3 => ['ccc'] })
    end

    it 'groups numbers by even/odd' do
      result = group_by_even_odd([1, 2, 3, 4, 5, 6])
      expect(result).to eq({ odd: [1, 3, 5], even: [2, 4, 6] })
    end
  end

  describe 'Inject (alternative to reduce)' do
    it 'calculates product with inject' do
      result = product_of_array([2, 3, 4])
      expect(result).to eq(24)
    end

    it 'builds hash from array using inject' do
      result = build_hash_from_array([1, 2, 3])
      expect(result).to eq({ 1 => 1, 2 => 4, 3 => 9 })
    end
  end

  describe 'Min, Max, and Sort' do
    it 'finds element with maximum property' do
      result = find_longest_word(%w[a bbb cc dddd])
      expect(result).to eq('dddd')
    end

    it 'finds minimum value' do
      result = find_smallest_number([5, 2, 8, 1, 9])
      expect(result).to eq(1)
    end

    it 'sorts by custom property' do
      result = sort_by_length(%w[ccc a bb dddd])
      expect(result).to eq(%w[a bb ccc dddd])
    end
  end

  describe 'Splat Operators' do
    it 'destructures arrays with splat' do
      # In Java: need manual index access
      # In Ruby: elegant destructuring
      result = first_and_rest([1, 2, 3, 4, 5])
      expect(result).to eq([1, [2, 3, 4, 5]])
    end

    it 'accepts variable number of arrays' do
      result = combine_arrays([1, 2], [3, 4], [5, 6])
      expect(result).to eq([1, 2, 3, 4, 5, 6])
    end

    it 'merges multiple hashes with double splat' do
      result = merge_multiple_hashes(a: 1, b: 2, c: 3)
      expect(result).to eq({ a: 1, b: 2, c: 3 })
    end
  end

  describe 'Lazy Evaluation' do
    it 'works with infinite ranges efficiently' do
      # In Java: would need custom Iterator or Stream.generate
      # In Ruby: .lazy makes it simple
      result = first_5_evens_from_infinite
      expect(result).to eq([2, 4, 6, 8, 10])
    end

    it 'processes only what is needed' do
      # Without .lazy, this would process entire range first
      result = lazy_map_and_take(1..1000, 3)
      expect(result).to eq([2, 4, 6])
    end
  end

  describe 'Blocks with Multiple Parameters' do
    it 'iterates hash with key and value' do
      hash = { name: 'Alice', age: 30, city: 'NYC' }
      result = hash_each_demo(hash)
      puts result
      expect(result).to include('name: Alice')
      expect(result).to include('age: 30')
      expect(result).to include('city: NYC')
    end

    it 'zips array with its indices' do
      result = zip_with_index(%w[a b c])
      expect(result).to eq([['a', 0], ['b', 1], ['c', 2]])
    end
  end

  describe 'Chunk and Slice' do
    it 'slices array into chunks' do
      result = chunk_by_size([1, 2, 3, 4, 5, 6, 7])
      expect(result).to eq([[1, 2], [3, 4], [5, 6], [7]])
    end

    it 'chunks consecutive numbers' do
      # Very powerful for grouping sequential data
      result = chunk_consecutive([1, 2, 4, 5, 6, 8, 10, 11])
      expect(result).to eq([[1, 2], [4, 5, 6], [8], [10, 11]])
    end
  end
end
