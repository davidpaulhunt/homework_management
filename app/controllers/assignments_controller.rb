class AssignmentsController < ApplicationController

  before_action :set_assignment, only: [:show, :edit, :update, :destroy]
  before_filter :is_instructor, only: [:new, :create, :edit, :update, :destroy]

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
    Notification.mark_reviewed(params[:id], current_user.id)
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
    params.require(:assignment).permit(:title, :due_date, :content, :cohort_id)
  end

  def set_assignment
    @assignment = Assignment.find(params[:id])
  end

  def is_instructor
    if !current_user.is_instructor? then choose_path(current_user) end
  end

end