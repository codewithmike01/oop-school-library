require_relative '../person'

describe Person do
  before(:all) do
    @person = Person.new(12, 'Feddy Hooks', parent_permission: false)
  end
  context 'Tesing the person class' do
    it 'has instance of person' do
      expect(@person).to be_instance_of Person
    end

    it 'has return value age' do
      expect(@person.age).to eq(12)
    end

    it 'has return value name' do
      expect(@person.name).to eq 'Feddy Hooks'
    end

    it 'has return value can use services' do
      expect(@person.can_use_services).to eq false
    end
  end
end
