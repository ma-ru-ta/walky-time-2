class Admin::CommentsController < ApplicationController

  # before_action :set_comment, only: [:show, :destroy]
  before_action :authenticate_admin!

  def index
    @comments = Comment.page(params[:page]).per(20)
    @users = User.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    # redirect_to admin_post_path(@comment.post_id)
    redirect_to request.referer, notice: 'コメントが削除されました'
  end


end
