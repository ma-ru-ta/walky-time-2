class Admin::CommentsController < ApplicationController
  def index
    @comments = Comment.page(params[:page])
    @post = Post.find(params[:id])
  end

  def show
  end

  def destroy
  end


end
