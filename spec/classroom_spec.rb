require_relative '../classroom'
require_relative '../student'

describe Classroom do
  before(:all) do
    @classroom = Classroom.new('Math')
  end

  context 'Tesing the classroom class' do
    it 'has instance of classroom' do
      expect(@classroom).to be_instance_of Classroom
    end

    it 'has return value name' do
      expect(@classroom.label).to eq('Math')
    end

    it 'add student to the classroom' do
      student = Student.new(27, 'Mike', parent_permission: true)
      @classroom.add_student(student)
      expect(@classroom.students[0].name).to eq 'Mike'
    end
  end
end
