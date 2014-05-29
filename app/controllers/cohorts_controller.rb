class CohortsController < ApplicationController

  def new
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.new(cohort_params)
    @cohort.save
    redirect_to users_path
  end

  def index
    @cohorts = Cohort.all
  end

  def show
    @cohort = Cohort.find(params[:id])
  end

  def edit
    @cohort = Cohort.find(params[:id])
    @cohort.update(cohort_params)
  end

  def destroy
    @cohort = Cohort.find(params[:id])
    @cohort.destroy
  end

  private

  def cohort_params
    params.require(:cohort).permit!
  end

end