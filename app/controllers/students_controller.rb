class StudentsController < ApplicationController
  before_action :set_student, only:  [:show, :edit, :update, :destroy]
  
  # GET /students
  def index
    @title = t('view.students.index_title')
    @students = Student.page(params[:page])
  end

  # GET /students/1
  def show
    @title = t('view.students.show_title')
  end

  # GET /students/new
  def new
    @title = t('view.students.new_title')
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
    @title = t('view.students.edit_title')
  end

  # POST /students
  def create
    @title = t('view.students.new_title')
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: t('view.students.correctly_created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /students/1
  def update
    @title = t('view.students.edit_title')

    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: t('view.students.correctly_updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_student_url(@student), alert: t('view.students.stale_object_error')
  end

  # DELETE /students/1
  def destroy
    @student.destroy
    redirect_to students_url, notice: t('view.students.correctly_destroyed')
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(
      :firstname, :lastname, :identification, :kind
    )
  end
end
