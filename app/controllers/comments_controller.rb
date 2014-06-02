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

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy!
  end

  private

  def comment_params
    params.require(:comment).permit(:id, :content, :commentable_id, :commentable_type, :user_id)
  end

  def load_commentable
    id = params[:comment][:commentable_id]
    resource = params[:comment][:commentable_type].constantize
    resource.find(id)
  end

end