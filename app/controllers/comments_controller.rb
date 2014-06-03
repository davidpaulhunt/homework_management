class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to :back
    end
  end

  def show
    @comment = Comment.find(params[:id])
    Notification.mark_reviewed(params[:id], current_user.id)
    redirect_to load_commentable(@comment)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy!
  end

  private

  def comment_params
    params.require(:comment).permit(:id, :content, :commentable_id, :commentable_type, :user_id)
  end

  def load_commentable(comment)
    id = comment.commentable_id
    resource = comment.commentable_type.constantize
    resource.find(id)
  end

end