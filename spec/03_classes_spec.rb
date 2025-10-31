require_relative '../lib/03_classes'

RSpec.describe 'Lesson 3: Classes and OOP' do
  describe 'Basic Class Definition' do
    it 'creates a simple class with initialize' do
      # In Java: public Person(String name, int age) { this.name = name; ... }
      # In Ruby: def initialize(name, age) ...
      person = Person.new('Alice', 30)
      expect(person.name).to eq('Alice')
      expect(person.age).to eq(30)
    end

    it 'uses attr_accessor instead of getters/setters' do
      # In Java: private String name; public String getName() {...}
      # In Ruby: attr_accessor :name
      person = Person.new('Bob', 25)
      person.name = 'Robert'
      expect(person.name).to eq('Robert')
    end
  end

  describe 'Instance Methods' do
    it 'defines instance methods without public keyword' do
      # Everything is public by default in Ruby
      person = Person.new('Charlie', 35)
      expect(person.introduce).to eq('Hi, I am Charlie and I am 35 years old')
    end

    it 'can have methods with implicit return' do
      person = Person.new('Diana', 28)
      expect(person.birth_year).to eq(1997) # 2025 - 28
    end
  end

  describe 'Class Methods' do
    it 'defines class methods with self' do
      # In Java: public static Person create() { ... }
      # In Ruby: def self.create ... end
      expect(Person.species).to eq('Homo sapiens')
    end

    it 'can create factory methods' do
      person = Person.create_anonymous
      expect(person.name).to eq('Anonymous')
      expect(person.age).to eq(0)
    end
  end

  describe 'Visibility' do
    it 'has private methods that cannot be called from outside' do
      person = Person.new('Eve', 22)
      expect(person.public_info).to include('secret')
      
      # This should raise an error because secret_code is private
      expect { person.secret_code }.to raise_error(NoMethodError)
    end
  end

  describe 'Inheritance' do
    it 'uses < for inheritance (single inheritance only)' do
      # In Java: class Employee extends Person { ... }
      # In Ruby: class Employee < Person ... end
      employee = Employee.new('Frank', 40, 'Engineer')
      expect(employee.name).to eq('Frank')
      expect(employee.age).to eq(40)
      expect(employee.title).to eq('Engineer')
    end

    it 'can override parent methods' do
      employee = Employee.new('Grace', 35, 'Manager')
      expect(employee.introduce).to include('Engineer')
      expect(employee.introduce).to include('Grace')
    end

    it 'can call parent methods with super' do
      employee = Employee.new('Henry', 45, 'Director')
      intro = employee.introduce
      expect(intro).to include('Hi, I am Henry')
      expect(intro).to include('Director')
    end
  end

  describe 'Attribute Methods' do
    it 'uses attr_reader for read-only attributes' do
      # In Java: public String getId() { return id; } (no setter)
      # In Ruby: attr_reader :id
      account = BankAccount.new('ACC123', 1000)
      expect(account.id).to eq('ACC123')
      
      # This should not be possible
      expect { account.id = 'NEW' }.to raise_error(NoMethodError)
    end

    it 'uses attr_writer for write-only attributes' do
      # In Java: public void setPassword(String password) { ... } (no getter)
      # In Ruby: attr_writer :password
      account = BankAccount.new('ACC456', 500)
      account.password = 'secret123'
      
      # Cannot read password (write-only)
      expect { account.password }.to raise_error(NoMethodError)
    end

    it 'uses attr_accessor for both read and write' do
      account = BankAccount.new('ACC789', 750)
      expect(account.balance).to eq(750)
      account.balance = 1000
      expect(account.balance).to eq(1000)
    end
  end

  describe 'self keyword' do
    it 'uses self like this in Java' do
      counter = Counter.new
      counter.increment
      counter.increment
      expect(counter.value).to eq(2)
    end

    it 'can chain methods that return self' do
      counter = Counter.new
      result = counter.increment.increment.increment
      expect(result.value).to eq(3)
      expect(result).to be_a(Counter)
    end
  end
end
