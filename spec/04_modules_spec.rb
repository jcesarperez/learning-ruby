require_relative '../lib/04_modules'

RSpec.describe 'Lesson 4: Modules and Mixins' do
  describe 'Modules as Namespaces' do
    it 'uses modules to organize code' do
      # In Java: package com.example.utils; class StringHelper { ... }
      # In Ruby: module Utils; class StringHelper; ...
      result = Utils::StringHelper.capitalize_words('hello world')
      expect(result).to eq('Hello World')
    end

    it 'accesses constants in modules' do
      # In Java: public static final int MAX = 100;
      # In Ruby: module Math; PI = 3.14; end
      expect(Utils::Math::PI).to eq(3.14159)
    end
  end

  describe 'Mixins with include (instance methods)' do
    it 'includes module to add instance methods' do
      # In Java: interfaces only define contracts, no implementation
      # In Ruby: modules can have full implementation (mixins)
      dog = Dog.new('Rex')
      expect(dog.speak).to eq('Rex says Woof!')
    end

    it 'can mix in multiple modules' do
      # In Java: class Dog implements Speakable, Walkable { ... }
      # In Ruby: include Speakable, Walkable
      dog = Dog.new('Max')
      expect(dog.speak).to eq('Max says Woof!')
      expect(dog.walk).to eq('Max is walking')
    end
  end

  describe 'Mixins with extend (class methods)' do
    it 'extends module to add class methods' do
      # extend adds module methods as class methods
      expect(Cat.description).to eq('Cats are independent animals')
    end

    it 'can use both include and extend' do
      cat = Cat.new('Whiskers')
      expect(cat.speak).to eq('Whiskers says Meow!')
      expect(Cat.description).to be_a(String)
    end
  end

  describe 'Comparable Module' do
    it 'uses Comparable module for comparison operators' do
      # In Ruby, include Comparable and define <=> operator
      # Gets ==, <, >, <=, >= for free
      book1 = Book.new('Book A', 300)
      book2 = Book.new('Book B', 500)
      
      expect(book1 < book2).to be true
      expect(book2 > book1).to be true
      expect(book1 == book2).to be false
    end

    it 'can sort objects that include Comparable' do
      book1 = Book.new('Short', 100)
      book2 = Book.new('Long', 500)
      book3 = Book.new('Medium', 300)
      
      sorted = [book2, book3, book1].sort
      expect(sorted.map(&:title)).to eq(['Short', 'Medium', 'Long'])
    end
  end

  describe 'Enumerable Module' do
    it 'uses Enumerable for collection methods' do
      # In Ruby, include Enumerable and define each
      # Gets map, select, find, reduce, etc. for free
      playlist = Playlist.new(['Song 1', 'Song 2', 'Song 3'])
      
      expect(playlist.count).to eq(3)
      expect(playlist.first).to eq('Song 1')
    end

    it 'gets map for free with Enumerable' do
      playlist = Playlist.new(['a', 'b', 'c'])
      result = playlist.map(&:upcase)
      expect(result).to eq(['A', 'B', 'C'])
    end
  end

  describe 'Module Methods' do
    it 'defines module methods that can be called directly' do
      # In Java: class Utils { public static String format(...) { ... } }
      # In Ruby: module Utils; def self.format(...); ...; end
      result = Formatter.format_name('john', 'doe')
      expect(result).to eq('John Doe')
    end
  end
end
