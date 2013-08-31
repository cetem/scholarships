require 'test_helper'

class StudentsControllerTest < ActionController::TestCase

  setup do
    @student = Fabricate(:student)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:students)
    assert_select '#unexpected_error', false
    assert_template "students/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:student)
    assert_select '#unexpected_error', false
    assert_template "students/new"
  end

  test "should create student" do
    assert_difference('Student.count') do
      post :create, student: Fabricate.attributes_for(:student)
    end

    assert_redirected_to student_url(assigns(:student))
  end

  test "should show student" do
    get :show, id: @student
    assert_response :success
    assert_not_nil assigns(:student)
    assert_select '#unexpected_error', false
    assert_template "students/show"
  end

  test "should get edit" do
    get :edit, id: @student
    assert_response :success
    assert_not_nil assigns(:student)
    assert_select '#unexpected_error', false
    assert_template "students/edit"
  end

  test "should update student" do
    patch :update, id: @student, 
      student: Fabricate.attributes_for(:student, identification: @student.identification)
    assert_redirected_to student_url(assigns(:student))
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, id: @student
    end

    assert_redirected_to students_path
  end
end
