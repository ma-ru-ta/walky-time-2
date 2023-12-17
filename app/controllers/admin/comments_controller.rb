class Admin::CommentsController < ApplicationController
  def index
    @comments = Comment.page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
  end


end
