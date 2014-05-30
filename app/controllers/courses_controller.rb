class CoursesController < ApplicationController

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    # @course.title = @course.title.titleize
    @course.save
    redirect_to users_path
  end

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    @course.update(course_params)
    @course.title = @course.title.titleize
    @course.save
    redirect_to users_path
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to users_path
  end

  private

  def course_params
    params.require(:course).permit!
  end

end