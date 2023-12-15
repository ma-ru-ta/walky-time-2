class Admin::HomesController < ApplicationController
  def top
    @posts = Post.page(params[:page])
    @prefectures = Prefecture.all
    if params[:prefecture]
      @posts = Post.where(prefecture_id: params[:prefecture]).page(params[:page])
    else
      @posts = Post.page(params[:page])
    end
  end
  
  def post_params
    params.require(:post).permit(:prefecture_id)
  end
end
