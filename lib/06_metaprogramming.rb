# Lesson 6: Basic Metaprogramming

# send - call methods dynamically
class Calculator
  def add(a, b)
    # TODO: Return a + b
  end

  def subtract(a, b)
    # TODO: Return a - b
  end

  def multiply(a, b)
    # TODO: Return a * b
  end
end

# define_method - create methods dynamically
class DynamicGreeter
  # Define methods for: hello, goodbye, welcome
  %w[hello goodbye welcome].each do |greeting|
    # TODO: Use define_method to create a method for each greeting
    # The method should return "#{greeting.capitalize}!"
    # Hint:
    # define_method(greeting) do
    #   "#{greeting.capitalize}!"
    # end
  end
end

# method_missing - intercept undefined method calls
class MagicMethod
  def method_missing(method_name, *args, &block)
    # TODO: Return "You called: #{method_name}"
  end

  def respond_to_missing?(method_name, include_private = false)
    # TODO: Return true (always respond to any method)
    # This is good practice when defining method_missing
  end
end

# method_missing for dynamic attributes
class DynamicAttributes
  def initialize
    @attributes = {}
  end

  def method_missing(method_name, *args)
    # TODO: Handle getter and setter methods
    # If method_name ends with '=', it's a setter: store in @attributes
    # Otherwise it's a getter: return from @attributes
    # Hint:
    # method_string = method_name.to_s
    # if method_string.end_with?('=')
    #   attribute_name = method_string.chomp('=').to_sym
    #   @attributes[attribute_name] = args.first
    # else
    #   @attributes[method_name]
    # end
  end

  def respond_to_missing?(method_name, include_private = false)
    true
  end
end

# class_eval / instance_eval
def add_method_to_string
  # TODO: Use class_eval to add a method to String class
  # Add method 'loudly' that returns upcase version
  # Then return 'hello'.loudly
  # Hint:
  # String.class_eval do
  #   define_method(:loudly) do
  #     upcase
  #   end
  # end
end

class ModifiableObject
  def add_custom_method
    # TODO: Use instance_eval to add a method to self
    # Add method 'custom_greeting' that returns 'Custom Hello!'
    # Hint:
    # instance_eval do
    #   def custom_greeting
    #     'Custom Hello!'
    #   end
    # end
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
    # TODO: Similar to DynamicAttributes but also track created fields
    # When a setter is called, add the field name to @created_fields
    method_string = method_name.to_s
    if method_string.end_with?('=')
      # TODO: setter logic
    else
      # TODO: getter logic
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    true
  end
end

# Open Classes (Monkey Patching)
class Integer
  def double
    # TODO: Return self * 2
  end

  def triple
    # TODO: Return self * 3
  end
end

class String
  def shout
    # TODO: Return "#{upcase}!"
  end

  def whisper
    # TODO: Return "#{self}..."
  end
end

# DSL Example
class Configuration
  def initialize(&block)
    @settings = {}
    # TODO: Execute the block in the context of this instance
    # Hint: instance_eval(&block) if block_given?
  end

  def set(key, value)
    # TODO: Store key-value pair in @settings
  end

  def get(key)
    # TODO: Retrieve value from @settings
  end
end
