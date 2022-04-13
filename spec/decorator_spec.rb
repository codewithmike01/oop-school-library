require_relative '../decorator'

describe Nameable do
  context 'Tesing the Nameable Decorator class' do
    it 'correct_name method should raise an error' do
      nameable = Nameable.new
      expect { nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
