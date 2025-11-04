# Lesson 6: Basic Metaprogramming

# send - call methods dynamically
class Calculator
  def add(a, b)
    # Return a + b
    a + b
  end

  def subtract(a, b)
    # Return a - b
    a - b
  end

  def multiply(a, b)
    # Return a * b
    a * b
  end
end

# define_method - create methods dynamically
class DynamicGreeter
  # Define methods for: hello, goodbye, welcome
  %w[hello goodbye welcome].each do |greeting|
    # Use define_method to create a method for each greeting
    # The method should return "#{greeting.capitalize}!"
    define_method(greeting) do
      "#{greeting.capitalize}!"
    end
  end
end

# method_missing - intercept undefined method calls
class MagicMethod
  def method_missing(method_name, *_args, &)
    # Return "You called: #{method_name}"
    "You called: #{method_name}"
  end

  def respond_to_missing?(_method_name, _include_private = false)
    # Return true (always respond to any method)
    # This is good practice when defining method_missing
    true
  end
end

# method_missing for dynamic attributes
class DynamicAttributes
  def initialize
    @attributes = {}
  end

  def method_missing(method_name, *args)
    # Handle getter and setter methods
    # If method_name ends with '=', it's a setter: store in @attributes
    # Otherwise it's a getter: return from @attributes
    method_string = method_name.to_s
    if method_string.end_with?('=')
      attribute_name = method_string.chomp('=').to_sym
      @attributes[attribute_name] = args.first
    else
      @attributes[method_name]
    end
  end

  def respond_to_missing?(_method_name, _include_private = false)
    true
  end
end

# class_eval / instance_eval
def add_method_to_string
  # Use class_eval to add a method to String class
  # Add method 'loudly' that returns upcase version
  # Then return 'hello'.loudly
  String.class_eval do
    define_method(:loudly) do
      upcase
    end
  end
  'hello'.loudly
end

class ModifiableObject
  def add_custom_method
    # Use instance_eval to add a method to self
    # Add method 'custom_greeting' that returns 'Custom Hello!'
    instance_eval do
      def custom_greeting
        'Custom Hello!'
      end
    end
  end
end

# Dynamic attr_accessor
class FlexibleUser
  def initialize
    @fields = {}
    @created_fields = []
  end

  attr_reader :created_fields

  def method_missing(method_name, *args)
    # Similar to DynamicAttributes but also track created fields
    # When a setter is called, add the field name to @created_fields
    method_string = method_name.to_s
    if method_string.end_with?('=')
      # setter logic
      field_name = method_string.chomp('=').to_sym
      @fields[field_name] = args.first
      @created_fields << field_name unless @created_fields.include?(field_name)
    else
      # getter logic
      @fields[method_name]
    end
  end

  def respond_to_missing?(_method_name, _include_private = false)
    true
  end
end

# Open Classes (Monkey Patching)
class Integer
  def double
    # Return self * 2
    self * 2
  end

  def triple
    # Return self * 3
    self * 3
  end
end

class String
  def shout
    # Return "#{upcase}!"
    "#{upcase}!"
  end

  def whisper
    # Return "#{downcase}..."
    "#{downcase}..."
  end
end

# DSL Example
class Configuration
  def initialize(&)
    @settings = {}
    # Execute the block in the context of this instance
    # Hint: instance_eval(&block) if block_given?
    instance_eval(&) if block_given?
  end

  def set(key, value)
    # Store key-value pair in @settings
    @settings[key] = value
  end

  def get(key)
    # Retrieve value from @settings
    @settings[key]
  end
end
