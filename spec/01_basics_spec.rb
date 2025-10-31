require 'spec_helper'
require_relative '../lib/01_basics'

RSpec.describe 'Lesson 1: Basic Syntax and Duck Typing' do
  describe 'Variables and Types' do
    it 'does not require type declarations (duck typing)' do
      # In Java: String message = "Hello";
      # In Ruby: just assign
      result = say_hello_to('World')
      expect(result).to eq('Hello, World!')
    end

    it 'uses nil instead of null' do
      result = get_optional_hello(false)
      expect(result).to be_nil

      result = get_optional_hello(true)
      expect(result).to eq('hello')
    end

    it 'works with symbols (like lightweight strings)' do
      # Symbols are like interned strings, great for keys
      result = classify_type(:admin)
      expect(result).to eq('Administrator')

      result = classify_type(:user)
      expect(result).to eq('Regular User')
    end
  end

  describe 'String Interpolation' do
    it 'interpolates variables directly in strings' do
      # In Java: "User: " + name + " (ID: " + id + ")"
      # In Ruby: "User: #{name} (ID: #{id})"
      result = format_user('Alice', 42)
      expect(result).to eq('User: Alice (ID: 42)')
    end

    it 'can interpolate expressions' do
      result = calculate_message(10, 5)
      expect(result).to eq('10 + 5 = 15')
    end
  end

  describe 'Methods' do
    it 'has implicit return (last expression is returned)' do
      # No need for "return" keyword
      expect(add(3, 4)).to eq(7)
      expect(multiply(3, 4)).to eq(12)
    end

    it 'uses ? for predicate methods (like isValid in Java)' do
      # In Java: boolean isEven(int n)
      # In Ruby: def even?(n)
      expect(even?(4)).to be true
      expect(even?(5)).to be false
    end

    it 'uses ! for dangerous/mutating methods' do
      text = 'hello'
      # Methods with ! typically modify the object
      result = upcase!(text)
      expect(result).to eq('HELLO')
      expect(text).to eq('HELLO') # Original was modified
    end
  end

  describe 'Everything is an Object' do
    it 'numbers are objects with methods' do
      # In Java: for(int i=0; i<5; i++) { ... }
      # In Ruby: 5.times { ... }
      result = repeat_action(3)
      expect(result).to eq(%w[action action action])
    end

    it 'can call methods on numbers directly' do
      expect(number_even?(10)).to be true
      expect(number_even?(7)).to be false
    end
  end

  describe 'Truthiness' do
    it 'only nil and false are falsy (unlike Java where 0, empty string, etc are falsy in some contexts)' do
      # In Ruby, only nil and false are falsy
      # Everything else (including 0, "", []) is truthy
      expect(truthy?(0)).to be true
      expect(truthy?('')).to be true
      expect(truthy?([])).to be true
      expect(truthy?(false)).to be false
      expect(truthy?(nil)).to be false
    end
  end
end
