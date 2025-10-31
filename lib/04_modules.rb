# Lesson 4: Modules and Mixins

# Modules as Namespaces
module Utils
  module Math
    # TODO: Define constant PI = 3.14159
  end

  class StringHelper
    def self.capitalize_words(text)
      # TODO: Capitalize each word in text
      # Hint: text.split.map(&:capitalize).join(' ')
    end
  end
end

# Mixins - modules that add behavior
module Speakable
  def speak
    # TODO: Return "#{@name} says #{sound}!"
    # This calls the sound method that should be defined in the class
  end
end

module Walkable
  def walk
    # TODO: Return "#{@name} is walking"
  end
end

module Describable
  def description
    # TODO: Return a generic description
    # This will be called as a class method when extended
  end
end

class Dog
  # TODO: include Speakable and Walkable
  
  attr_reader :name
  
  def initialize(name)
    @name = name
  end

  def sound
    # TODO: Return 'Woof!'
  end
end

class Cat
  # TODO: include Speakable (for instance methods)
  # TODO: extend Describable (for class methods)
  
  attr_reader :name
  
  def initialize(name)
    @name = name
  end

  def sound
    # TODO: Return 'Meow!'
  end

  def self.description
    # TODO: Return 'Cats are independent animals'
  end
end

# Comparable Module
class Book
  # TODO: include Comparable
  attr_reader :title, :pages
  
  def initialize(title, pages)
    @title = title
    @pages = pages
  end

  def <=>(other)
    # TODO: Define the spaceship operator to compare books by pages
    # Return -1 if self < other, 0 if equal, 1 if self > other
    # Hint: @pages <=> other.pages
  end
end

# Enumerable Module
class Playlist
  # TODO: include Enumerable
  
  def initialize(songs)
    @songs = songs
  end

  def each(&block)
    # TODO: Implement each to iterate over @songs
    # This gives you all Enumerable methods for free!
    # Hint: @songs.each(&block)
  end
end

# Module Methods (like static methods in Java)
module Formatter
  def self.format_name(first_name, last_name)
    # TODO: Capitalize first and last name and return "First Last"
  end
end
