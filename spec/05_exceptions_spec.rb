require_relative '../lib/05_exceptions'

RSpec.describe 'Lesson 5: Exception Handling' do
  describe 'Basic Exception Handling' do
    it 'uses begin/rescue/end instead of try/catch' do
      # In Java: try { ... } catch (Exception e) { ... }
      # In Ruby: begin ... rescue => e ... end
      result = safe_divide(10, 2)
      expect(result).to eq(5)
      
      result = safe_divide(10, 0)
      expect(result).to eq('Cannot divide by zero')
    end

    it 'can rescue specific exception types' do
      result = parse_number('123')
      expect(result).to eq(123)
      
      result = parse_number('abc')
      expect(result).to eq('Not a valid number')
    end
  end

  describe 'Raising Exceptions' do
    it 'uses raise instead of throw' do
      # In Java: throw new IllegalArgumentException("message");
      # In Ruby: raise ArgumentError, "message"
      expect { validate_age(25) }.not_to raise_error
      expect { validate_age(-5) }.to raise_error(ArgumentError, 'Age cannot be negative')
    end

    it 'can raise custom exceptions' do
      expect { validate_email('test@example.com') }.not_to raise_error
      expect { validate_email('invalid') }.to raise_error(InvalidEmailError)
    end
  end

  describe 'ensure (like finally in Java)' do
    it 'executes ensure block regardless of exceptions' do
      # In Java: try { ... } finally { ... }
      # In Ruby: begin ... ensure ... end
      result = read_file_safely('test.txt')
      expect(result).to include('closed')
    end
  end

  describe 'Inline rescue' do
    it 'can rescue at the end of a method without begin' do
      # This is more idiomatic Ruby
      result = risky_operation_safe
      expect(result).to be_a(String)
    end

    it 'can rescue inline for single expressions' do
      # In Ruby: value = risky_call() rescue default_value
      result = get_value_with_default
      expect(result).to eq('default')
    end
  end

  describe 'Multiple rescue clauses' do
    it 'can rescue different exception types' do
      result = process_input('valid')
      expect(result).to eq('Processed: valid')
      
      result = process_input('zero_error')
      expect(result).to include('division')
      
      result = process_input('type_error')
      expect(result).to include('type')
      
      result = process_input('other_error')
      expect(result).to include('unexpected')
    end
  end

  describe 'Retry' do
    it 'can retry operations with retry keyword' do
      # Ruby has a retry keyword to retry the begin block
      result = unreliable_operation
      expect(result).to be_a(String)
    end
  end

  describe 'Custom Exceptions' do
    it 'creates custom exception classes by inheriting StandardError' do
      # In Java: class MyException extends Exception { ... }
      # In Ruby: class MyException < StandardError; end
      expect(InvalidEmailError.new).to be_a(StandardError)
      expect(InsufficientFundsError.new('test')).to be_a(StandardError)
    end

    it 'can add custom behavior to exceptions' do
      error = InsufficientFundsError.new('Test account')
      expect(error.message).to include('Test account')
      expect(error.message).to include('Insufficient funds')
    end
  end
end
