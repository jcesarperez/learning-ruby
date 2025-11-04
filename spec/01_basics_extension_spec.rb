require 'spec_helper'
require_relative '../lib/01_basics_extension'

RSpec.describe 'Lesson 1 Extension: More Syntax and Control Statements' do
  describe 'Conditional Modifiers' do
    it 'uses if at the end of line (statement modifier)' do
      # In Java: if (age >= 18) return "Welcome!";
      # In Ruby: "Welcome!" if age >= 18
      expect(greet_if_adult(20)).to eq('Welcome!')
      expect(greet_if_adult(15)).to be_nil
    end

    it 'uses unless instead of if !' do
      # unless is more readable than "if not"
      expect(reject_unless_valid('test@example.com')).to be_nil
      expect(reject_unless_valid('invalid')).to eq('Invalid email')
    end
  end

  describe 'Case/When (like switch but better)' do
    it 'uses case/when with ranges' do
      # In Java: switch with fall-through cases
      # In Ruby: case/when with ranges (much cleaner)
      expect(classify_grade(95)).to eq('A')
      expect(classify_grade(85)).to eq('B')
      expect(classify_grade(75)).to eq('C')
      expect(classify_grade(65)).to eq('F')
      expect(classify_grade(-1)).to eq('error')
    end

    it 'uses case/when with symbols' do
      expect(process_command(:start)).to eq('Starting...')
      expect(process_command(:stop)).to eq('Stopping...')
      expect(process_command(:pause)).to eq('Pausing...')
      expect(process_command(:unknown)).to eq('Unknown command')
    end
  end

  describe 'Ranges' do
    it 'creates inclusive ranges with ..' do
      # In Java: no native range type
      # In Ruby: 1..5 includes both 1 and 5
      range = inclusive_range
      expect(range).to eq(1..5)
      expect(range.to_a).to eq([1, 2, 3, 4, 5])
    end

    it 'creates exclusive ranges with ...' do
      # 1...5 includes 1 but excludes 5
      range = exclusive_range
      expect(range).to eq(1...5)
      expect(range.to_a).to eq([1, 2, 3, 4])
    end

    it 'checks if number is in range' do
      expect(number_in_range?(5, 1, 10)).to be true
      expect(number_in_range?(15, 1, 10)).to be false
    end

    it 'converts ranges to arrays' do
      expect(range_to_array(1, 5)).to eq([1, 2, 3, 4, 5])
    end
  end

  describe 'Loops (different from Java for loops)' do
    it 'uses until (opposite of while)' do
      # In Java: while (!condition) { ... }
      # In Ruby: until condition do ... end
      result = count_until(5)
      expect(result).to eq([0, 1, 2, 3, 4])
    end

    it 'uses next to skip iterations (like continue)' do
      # In Java: continue;
      # In Ruby: next
      result = skip_evens(6)
      expect(result).to eq([1, 3, 5])
    end

    it 'uses loop with break for infinite loops' do
      result = loop_with_break([1, 3, 7, 2, 9])
      expect(result).to eq(7)
    end
  end

  describe 'Safe Navigation Operator' do
    it 'uses &. to safely call methods on nil' do
      # In Java: if (text != null) text.toUpperCase()
      # In Ruby: text&.upcase
      expect(safe_upcase('hello')).to eq('HELLO')
      expect(safe_upcase(nil)).to be_nil
    end

    it 'chains safe navigation for nested access' do
      user = { profile: { name: 'Alice' } }
      expect(get_user_name(user)).to eq('Alice')

      empty_user = {}
      expect(get_user_name(empty_user)).to be_nil
    end
  end

  describe 'Logical Operators with Words' do
    it 'uses and/or instead of &&/||' do
      # 'and' and 'or' have lower precedence
      # Use && and || for most cases, and/or for control flow
      expect(both_conditions?(5, 10)).to be true
      expect(both_conditions?(-1, 10)).to be false

      expect(either_condition?(15, 5)).to be true
      expect(either_condition?(5, 5)).to be false
    end

    it 'has low precedence, even lower than =' do
      a = false
      b = true
      result = a or b
      # Ruby parses this as: (result = a) or b
      # => result gets the value of a (false)
      expect(result).to be false
    end

    it 'shows that and has lower precedence than =' do
      a = true
      b = false
      result = a and b
      # Ruby parses this as: (result = a) and b
      # So result gets 'a' (true) before evaluating 'and'
      expect(result).to be true
    end

    it 'or can be used for control flow' do
      called = false

      # 'or' reads like natural English: "do this or do that"
      try_action { raise 'fail' } or called = true
      expect(called).to be true
    end

    it 'and can be used for control flow' do
      called = false

      try_action { raise 'fail' } and called = true
      expect(called).to be false

      try_action { true } and called = true
      expect(called).to be true
    end
  end
end
