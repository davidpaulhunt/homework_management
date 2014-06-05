class CohortsController < ApplicationController

  before_filter :is_admin, only: [:new, :create, :edit, :update, :destroy]

  def new
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.new(cohort_params)
    @cohort.save
    redirect_to admins_path
  end

  def index
    @cohorts = Cohort.all
  end

  def show
    @cohort = Cohort.find(params[:id])
  end

  def edit
    @cohort = Cohort.find(params[:id])
  end

  def update
    @cohort = Cohort.find(params[:id])
    @cohort.update(cohort_params)
    redirect_to admins_path
  end

  def destroy
    @cohort = Cohort.find(params[:id])
    @cohort.destroy
    redirect_to admins_path
  end

  private

  def cohort_params
    params.require(:cohort).permit(:course_id, :start_date, :end_date, :location_id, :instructor_id, :teaching_assistant_id)
  end

end