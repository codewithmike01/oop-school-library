require_relative '../teacher'

describe Teacher do
  before(:all) do
    @teacher = Teacher.new(73, 'Liar', 'Jack Dozer')
  end
  context 'Tesing the teacher class' do
    it 'has instance of teacher' do
      expect(@teacher).to be_instance_of Teacher
    end

    it 'has return value name' do
      expect(@teacher.age).to eq(73)
    end

    it 'has return value can use services' do
      expect(@teacher.name).to eq 'Jack Dozer'
    end
  end
end
