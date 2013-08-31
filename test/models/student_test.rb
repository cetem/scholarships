require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  def setup
    @student = Fabricate(:student)
  end

  test 'create' do
    assert_difference ['Student.count', 'Version.count'] do
      Student.create!(Fabricate.attributes_for(:student))
    end 
  end
    
  test 'update' do
    assert_difference 'Version.count' do
      assert_no_difference 'Student.count' do
        assert @student.update_attributes(firstname: 'Updated')
      end
    end

    assert_equal 'Updated', @student.reload.firstname
  end
    
  test 'destroy' do 
    assert_difference 'Version.count' do
      assert_difference('Student.count', -1) { @student.destroy }
    end
  end
    
  test 'validates blank attributes' do
    @student.firstname = ''
    @student.lastname = ''
    @student.identification = ''
    
    assert @student.invalid?
    assert_equal 3, @student.errors.size
    assert_equal [error_message_from_model(@student, :firstname, :blank)],
      @student.errors[:firstname]
    assert_equal [error_message_from_model(@student, :lastname, :blank)],
      @student.errors[:lastname]
    assert_equal [error_message_from_model(@student, :identification, :blank)],
      @student.errors[:identification]
  end
    
  test 'validates unique attributes' do
    new_student = Fabricate(:student)
    @student.identification = new_student.identification

    assert @student.invalid?
    assert_equal 1, @student.errors.size
    assert_equal [error_message_from_model(@student, :identification, :taken)],
      @student.errors[:identification]
  end
end
