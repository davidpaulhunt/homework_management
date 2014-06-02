class AssignmentsController < ApplicationController

  before_action :set_assignment, only: [:show, :edit, :update, :destroy]

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new(assignment_params)
    if @assignment.save
      redirect_to instructors_path, notice: "Assignment added!"
    else
      render :new, alert: "Oops, there was an error."
    end
  end

  def index
  end

  def show
    @new_comment = @assignment.comments.build
  end

  def edit
  end

  def update
    if @assignment.update_attributes(assignment_params)
      redirect_to @assignment, notice: "Assignment updated!"
    else
      render :edit, alert: "Oops, there was an error."
    end
  end

  def destroy
    if @assignment.destroy
      redirect_to instructors_path, notice: "Assignment deleted!"
    else
      redirect_to instructors_path, notice: "Oops, there was an error in deleting the assignment."
    end
  end

  private

  def assignment_params
    params.require(:assignment).permit!
  end

  def set_assignment
    @assignment = Assignment.find(params[:id])
  end

end