# Lesson 4: Modules and Mixins

# Modules as Namespaces
module Utils
  module Math
    # Define constant PI = 3.14159
    PI = 3.14159
  end

  class StringHelper
    def self.capitalize_words(text)
      # Capitalize each word in text
      # Hint: text.split.map(&:capitalize).join(' ')
      text.split.map(&:capitalize).join(' ')
    end
  end
end

# Mixins - modules that add behavior
module Speakable
  def speak
    # Return "#{@name} says #{sound}"
    # This calls the sound method that should be defined in the class
    "#{@name} says #{sound}"
  end
end

module Walkable
  def walk
    # Return "#{@name} is walking"
    "#{@name} is walking"
  end
end

module Describable
  def description
    # Return a generic description
    # This will be called as a class method when extended
    'description not provided'
  end
end

class Dog
  # include Speakable and Walkable
  include Speakable
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def sound
    # Return 'Woof!'
    'Woof!'
  end
end

class Cat
  # include Speakable (for instance methods)
  # extend Describable (for class methods)
  include Speakable
  extend Describable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def sound
    # Return 'Meow!'
    'Meow!'
  end

  def self.description
    # Return 'Cats are independent animals'
    'Cats are independent animals'
  end
end

# Comparable Module
class Book
  # include Comparable
  include Comparable

  attr_reader :title, :pages

  def initialize(title, pages)
    @title = title
    @pages = pages
  end

  def <=>(other)
    # Define the spaceship operator to compare books by pages
    # Return -1 if self < other, 0 if equal, 1 if self > other
    # Hint: @pages <=> other.pages
    @pages <=> other.pages
  end
end

# Enumerable Module
class Playlist
  # include Enumerable
  include Enumerable

  def initialize(songs)
    @songs = songs
  end

  def each(&)
    # Implement each to iterate over @songs
    # This gives you all Enumerable methods for free!
    # Hint: @songs.each(&block)
    @songs.each(&)
  end
end

# Module Methods (like static methods in Java)
module Formatter
  def self.format_name(first_name, last_name)
    # Capitalize first and last name and return "First Last"
    cap_first_name = Utils::StringHelper.capitalize_words(first_name)
    cap_last_name = Utils::StringHelper.capitalize_words(last_name)
    "#{cap_first_name} #{cap_last_name}"
  end
end
