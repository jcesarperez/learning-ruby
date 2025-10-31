# frozen_string_literal: true

require_relative '../lib/greeter'

RSpec.describe Greeter do
  describe '#greet' do
    it 'returns a personalized greeting' do
      greeter = Greeter.new
      expect(greeter.greet('World')).to eq('Hello, World!')
    end
  end
end
