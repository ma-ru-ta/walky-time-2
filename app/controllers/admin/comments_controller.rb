class Admin::CommentsController < ApplicationController
  def index
    @comments = Comment.page(params[:page])
  end

  def show
  end

  def destroy
  end
end
