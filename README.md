# Learning Ruby with Test-Driven Development

A modern Ruby project focused on learning Ruby through test-driven development. This project is set up with RSpec for testing and includes VS Code integration for a smooth development experience.

## 🚀 Getting Started

### Prerequisites
- Ruby 3.3.0+
- Visual Studio Code
- Bundler gem (`gem install bundler`)

### Setup

1. Clone this repository:
   ```bash
   git clone https://github.com/jcesarperez/learning-ruby.git
   cd learning-ruby
   ```

2. Install dependencies:
   ```bash
   bundle install
   ```

3. Install recommended VS Code extensions:
   - Ruby
   - Ruby Test Explorer
   - Test Explorer UI
   - endwise (automatically adds `end` keywords for Ruby blocks)

4. Open the project in VS Code:
   ```bash
   code .
   ```

5. The project is already configured for VS Code with test integration. If you need to modify the settings, check `.vscode/settings.json`.

## 🧪 Running Tests

### Using VS Code Test Explorer

1. Open the Testing sidebar (beaker icon)
2. Click the play button to run all tests, or:
   - Run individual test files
   - Run specific test cases
   - See test results in real-time

### Using the Terminal

```bash
# Run all tests
bundle exec rspec

# Run a specific test file
bundle exec rspec spec/greeter_spec.rb

# Run with documentation format
bundle exec rspec --format documentation
```

## 📚 Learning Path

This project will guide you through learning Ruby concepts using Test-Driven Development (TDD). Each concept is introduced with tests first, followed by implementation.

### Core Concepts You'll Learn

- **Object-Oriented Programming**
  - Classes and Objects
  - Instance Methods and Variables
  - Class Methods and Variables
  - Inheritance and Modules

- **Ruby Fundamentals**
  - Data Types and Variables
  - Control Structures
  - Collections (Arrays, Hashes)
  - Blocks and Iterators
  - Error Handling

- **Testing Best Practices**
  - Test-Driven Development
  - RSpec Syntax and Patterns
  - Test Organization
  - Mocking and Stubbing

## 📁 Project Structure

```
.
├── lib/              # Source code
│   └── greeter.rb    # Example class
├── spec/             # Test files
│   ├── greeter_spec.rb
│   └── spec_helper.rb
└── .vscode/          # Editor configuration
```

## 🔍 Development Features

Your VS Code environment includes:

- Test running and debugging
- Code completion and documentation
- Syntax highlighting
- Auto-formatting
- Inline error detection

## 📖 Additional Resources

- [Ruby Documentation](https://ruby-doc.org/)
- [RSpec Documentation](https://rspec.info/)
- [Ruby Style Guide](https://rubystyle.guide/)

## 🤝 Contributing

Feel free to contribute to this learning project:

1. Fork the repository
2. Create your feature branch
3. Add or improve examples
4. Submit a pull request

## 🤖 Disclaimer

This tutorial has been designed by AI

## 📝 License

This project is open source and available under the MIT License.

---

Happy Ruby Learning! 🚀