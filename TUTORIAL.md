# Ruby for Java Developers - TDD Tutorial

This tutorial is designed for Java developers who want to learn Ruby. Each lesson has tests you need to make pass.

## You're All Set! 🎉

Your Ruby learning environment is ready. All 6 lessons are created with tests that currently fail (Red phase).

**What You Have:**
- ✅ 6 lessons covering Ruby fundamentals for Java developers
- ✅ 79 failing tests waiting to be fixed
- ✅ Implementation files with TODOs and hints
- ✅ Rubocop configured for the tutorial

## 🎯 Approach

- **Red → Green → Refactor**: First run tests (they fail), then make them pass
- **Key Differences**: We focus on what's different from Java
- **Direct Practice**: Real code, not excessive theory

## 📚 Lessons

### Lesson Order

1. **01_basics** - Syntax, types, strings, methods (11 tests)
2. **02_collections** - Arrays, hashes, blocks, iterators (18 tests)
3. **03_classes** - Classes, inheritance, attributes (15 tests)
4. **04_modules** - Modules, mixins, namespaces (11 tests)
5. **05_exceptions** - Exception handling, raise/rescue (11 tests)
6. **06_metaprogramming** - Dynamic methods, method_missing (13 tests)

### Lesson 1: Basic Syntax and Duck Typing
**File**: `spec/01_basics_spec.rb`

**Differences from Java**:
- No type declarations (duck typing)
- No semicolons needed
- `nil` instead of `null`
- Symbols (`:symbol`) don't exist in Java
- Everything is an object, even numbers

**Concepts**:
- Variables without types
- Methods with `?` and `!`
- Implicit return
- String interpolation with `#{}`

### Lesson 2: Collections and Blocks
**File**: `spec/02_collections_spec.rb`

**Differences from Java**:
- Dynamic arrays (no need for `ArrayList`)
- Native hashes (like `HashMap` but with clean syntax)
- Blocks instead of verbose lambdas
- Functional methods: `map`, `select`, `reduce`
- No traditional `for`, use `.each`

**Concepts**:
- Arrays and Hashes
- Blocks with `do...end` and `{}`
- Iterators: `each`, `map`, `select`, `find`
- Method chaining

### Lesson 3: Classes and OOP
**File**: `spec/03_classes_spec.rb`

**Differences from Java**:
- No interfaces, there are modules (mixins)
- `attr_accessor`, `attr_reader`, `attr_writer` instead of getters/setters
- `initialize` instead of constructor with class name
- No method overloading
- Single inheritance but powerful mixins
- Everything is public by default

**Concepts**:
- Class definition
- Instance and class methods
- Automatic attributes
- `self` vs Java's `this`
- Visibility: `public`, `private`, `protected`

### Lesson 4: Modules and Mixins
**File**: `spec/04_modules_spec.rb`

**Differences from Java**:
- Mixins > Interfaces: you can include implementation
- `include` vs `extend`
- Simple namespacing
- No mandatory multiple files per class

**Concepts**:
- Modules as namespaces
- Modules as mixins
- `include` for instance methods
- `extend` for class methods

### Lesson 5: Exception Handling
**File**: `spec/05_exceptions_spec.rb`

**Differences from Java**:
- `begin/rescue/ensure/end` instead of `try/catch/finally`
- No checked exceptions
- `raise` instead of `throw`
- `rescue` can go at the end of a method without `begin`

**Concepts**:
- Raising exceptions
- Catching specific exceptions
- Retry and inline rescue

### Lesson 6: Basic Metaprogramming
**File**: `spec/06_metaprogramming_spec.rb`

**Differences from Java**:
- `method_missing` (doesn't exist in Java)
- `define_method` dynamically
- `send` to invoke methods by name
- Much more flexible than Java reflection

**Concepts**:
- Define methods dynamically
- `method_missing`
- `send` and `public_send`
- Open classes

## 🏃 How to Use This Tutorial

### Option 1: Work lesson by lesson (Recommended)

```bash
# Lesson 1: Basic Syntax
bundle exec rspec spec/01_basics_spec.rb

# Open lib/01_basics.rb and implement the methods
# Run tests again until they all pass
# Then move to lesson 2
```

### Option 2: See all lessons at once

```bash
# See all lessons and their status
bundle exec rspec --format documentation
```

### Option 3: Use VS Code Test Explorer

1. Open the Testing sidebar (beaker icon)
2. Expand the test tree
3. Run individual tests or entire lessons
4. See results in real-time

### Example Workflow

```bash
# 1. Run lesson 1 tests (they will fail)
bundle exec rspec spec/01_basics_spec.rb

# 2. Open lib/01_basics.rb in VS Code
# 3. Implement the first method
# 4. Run tests again
# 5. Repeat until all tests pass (Green phase)
# 6. Refactor if needed
# 7. Move to lesson 2
```

### TDD Steps for Each Test

1. **Red**: Run the test and see it fail
2. **Green**: Implement the minimum code to make it pass
3. **Refactor**: Clean up the code if needed
4. **Experiment**: Modify tests and try variations to understand better

## 📖 Additional Resources

- **Java/Ruby Differences**: https://www.ruby-lang.org/en/documentation/ruby-from-other-languages/to-ruby-from-java/
- **Ruby Style Guide**: https://rubystyle.guide/
- **RSpec**: https://rspec.info/

## 💡 Tips

1. **Don't look for types**: Trust duck typing
2. **Embrace blocks**: They're more powerful than Java 8+ lambdas
3. **Less code**: Ruby is expressive, you don't need so much boilerplate
4. **IRB/Pry**: Use the REPL to experiment (`irb` in terminal)
5. **Everything is an object**: Even `5.times { puts "Hello" }` works
6. **Read the test first**: Understand what's expected before implementing
7. **Look at Java comparisons**: Tests include comments showing Java equivalents
8. **Check the hints**: Implementation files have TODOs and hints
9. **Run rubocop**: Check your code style with `bundle exec rubocop lib/`

## 📊 Current Status

Run this to see your current progress:
```bash
bundle exec rspec --format progress
```

Initial status: **79 examples, 67 failures** (this is expected!)

Your goal: **79 examples, 0 failures** ✅

## ❓ Need Help?

- Read test descriptions - they explain the concepts
- Look at hints in implementation files
- Check Java comparison comments in tests
- Use `irb` or `pry` to experiment with Ruby code
- Review the lesson descriptions above

## 🎓 After the Tutorial

Once you complete the 6 lessons, you'll be ready to:
- Create Rails applications
- Understand production Ruby code
- Contribute to Ruby projects
- Apply metaprogramming carefully

Let's begin! 🚀
