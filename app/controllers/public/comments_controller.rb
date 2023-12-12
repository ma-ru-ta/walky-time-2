class Public::CommentsController < ApplicationController
  def new
  end

  def create
    book = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.book_id = book.id
    comment.save
    redirect_to request.referer
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
  end
  
  private
  
  def book_comment_params
    params.require(:comment).permit(:comment)
  end

end

