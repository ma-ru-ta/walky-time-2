class Public::FavoritesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: post.id)
    favorite.save
    redirect_to post_path(post)
    # redirect_to request.referer
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_to post_path(post)
  end

  def index
    @favorited_posts = current_user.favorited_posts
    # Userモデルでお気に入り一覧が見れるように絞り込んだので、↑でちょっとコントロールしてやった。
  end
end
