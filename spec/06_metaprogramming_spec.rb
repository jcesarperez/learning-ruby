require_relative '../lib/06_metaprogramming'

RSpec.describe 'Lesson 6: Basic Metaprogramming' do
  describe 'send method' do
    it 'calls methods dynamically by name' do
      # In Java: reflection is verbose and slow
      # In Ruby: it's simple and commonly used
      calc = Calculator.new
      expect(calc.send(:add, 5, 3)).to eq(8)
      expect(calc.send(:multiply, 4, 2)).to eq(8)
    end

    it 'can call methods with string names' do
      calc = Calculator.new
      expect(calc.send('subtract', 10, 3)).to eq(7)
    end
  end

  describe 'define_method' do
    it 'defines methods dynamically' do
      # DynamicGreeter defines methods at runtime
      greeter = DynamicGreeter.new
      expect(greeter.hello).to eq('Hello!')
      expect(greeter.goodbye).to eq('Goodbye!')
      expect(greeter.welcome).to eq('Welcome!')
    end
  end

  describe 'method_missing' do
    it 'intercepts calls to undefined methods' do
      # This is VERY powerful - doesn't exist in Java
      magic = MagicMethod.new
      expect(magic.anything).to eq('You called: anything')
      expect(magic.foo_bar).to eq('You called: foo_bar')
      expect(magic.some_random_method).to eq('You called: some_random_method')
    end

    it 'can create dynamic getters and setters' do
      obj = DynamicAttributes.new
      obj.name = 'Alice'
      obj.age = 30
      
      expect(obj.name).to eq('Alice')
      expect(obj.age).to eq(30)
    end
  end

  describe 'class_eval and instance_eval' do
    it 'evaluates code in the context of a class' do
      # Add methods to existing classes at runtime
      result = add_method_to_string
      expect(result).to eq('HELLO')
    end

    it 'modifies instance behavior dynamically' do
      obj = ModifiableObject.new
      obj.add_custom_method
      expect(obj.custom_greeting).to eq('Custom Hello!')
    end
  end

  describe 'attr_* as metaprogramming' do
    it 'creates methods dynamically with attr_accessor' do
      # attr_accessor is actually metaprogramming!
      # It defines getter and setter methods at runtime
      user = FlexibleUser.new
      user.name = 'Bob'
      user.email = 'bob@example.com'
      
      expect(user.name).to eq('Bob')
      expect(user.email).to eq('bob@example.com')
      expect(user.created_fields).to include(:name, :email)
    end
  end

  describe 'Open Classes' do
    it 'can add methods to existing classes' do
      # You can modify ANY class, even built-in ones
      # This is called "monkey patching"
      expect(5.double).to eq(10)
      expect(3.triple).to eq(9)
    end

    it 'can add methods to String' do
      expect('hello'.shout).to eq('HELLO!')
      expect('world'.whisper).to eq('world...')
    end
  end

  describe 'respond_to?' do
    it 'checks if object responds to a method' do
      # In Java: checking method existence is complex
      # In Ruby: simple with respond_to?
      calc = Calculator.new
      expect(calc.respond_to?(:add)).to be true
      expect(calc.respond_to?(:unknown_method)).to be false
    end
  end

  describe 'Real-world use case: DSL' do
    it 'creates a simple DSL (Domain Specific Language)' do
      # Many Ruby gems use metaprogramming to create DSLs
      # Example: RSpec, Rails routes, etc.
      config = Configuration.new do
        set :app_name, 'MyApp'
        set :version, '1.0.0'
        set :debug, true
      end
      
      expect(config.get(:app_name)).to eq('MyApp')
      expect(config.get(:version)).to eq('1.0.0')
      expect(config.get(:debug)).to be true
    end
  end
end
