class Public::CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  
  def new
  end

  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to request.referer
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.user == current_user
      comment.destroy
      flash[:notice] = 'コメントが削除されました'
    else
      flash[:alert] = '権限がありません'
    end
    redirect_to request.referer
    # その場に留まる
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end

