require_relative '../student'

describe Student do
  before(:all) do
    @student = Student.new(12, 'Feddy Hooks', parent_permission: false)
  end
  context 'Tesing the student class' do
    it 'has instance of student' do
      expect(@student).to be_instance_of Student
    end

    it 'has return value age' do
      expect(@student.age).to eq(12)
    end

    it 'has return value name' do
      expect(@student.name).to eq 'Feddy Hooks'
    end
  end
end
