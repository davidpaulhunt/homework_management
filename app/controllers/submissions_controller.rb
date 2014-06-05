class SubmissionsController < ApplicationController

  before_action :set_submission, only: [:show, :edit, :update, :destroy]
  before_action :set_assignment, only: [:new, :create]

  def new
    @submission = @assignment.submissions.new
  end

  def create
    @submission = @assignment.submissions.new(submission_params)
    if @submission.save
      redirect_to @assignment
    else
      render :new, notice: "Oops, there was a problem creating your submission."
    end
  end

  def index
  end

  def show
    Notification.mark_reviewed(params[:id], current_user.id)
    @new_comment = @submission.comments.build
  end

  def edit
  end

  def update
    if @submission.update_attributes(submission_params)
      redirect_to assignment_path(@submission.assignment.id)
    else
      render :edit, notice: "Oops, there was a problem updating your submission."
    end
  end

  def destroy
    temp = @submission.assignment
    if @submission.destroy
      redirect_to assignment_path(temp)
    else
      render :show
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:assignment_id, :content, :student_id)
  end

  def set_submission
    @submission = Submission.find(params[:id])
  end

  def set_assignment
    @assignment = Assignment.find(params[:assignment_id])
  end

end