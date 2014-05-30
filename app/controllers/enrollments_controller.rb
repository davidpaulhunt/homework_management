class EnrollmentsController < ApplicationController

  before_action :set_enrollment, only: [:show, :edit, :update, :destroy]
  before_action :set_enrollments, only: :index
  before_action :set_user

  def new
    @enrollment = Enrollment.new
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    if @enrollment.save
      redirect_to students_path, notice: "Enrollment created! Welcome aboard, matey."
    else
      render :new, alert: "Oops there was a problem with that. Try again later, please."
    end
  end

  def index
  end

  def show
    @enrollment = Enrollment.find(params[:id])
  end

  def edit
  end

  def update
    if @enrollment.update_attributes(enrollment_params)
      redirect_to students_path, notice: "Enrollment updated!"
    else
      render :edit, alert: "Oops! There was a problem, try again later, please."
    end
  end

  def destroy
    if @enrollment.destroy
      redirect_to students_path, notice: "Enrollment deleted."
    else
      render students_path, alert: "Oops! There was a problem, try again later, please."
    end
  end


  private

  def enrollment_params
    params.require(:enrollment).permit(:cohort_id, :student_id)
  end

  def set_user
    @user = current_user
  end

  def set_enrollment
    @enrollment = Enrollment.find(params[:id])
  end

  def set_enrollments
    @enrollments = current_user.enrollments
  end

end