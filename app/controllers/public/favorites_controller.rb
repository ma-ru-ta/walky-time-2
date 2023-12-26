class Public::FavoritesController < ApplicationController

  def create
    post = Post.find(params[:post_id])

    # favorite = current_user.favorites.new(post_id: post.id)
    # favorite.save
    # redirect_to request.referer

    # redirect_to request.referer

    if current_user
      favorite = current_user.favorites.new(post_id: post.id)
      favorite.save
    else
      redirect_to user_session_path
      return
    end
      redirect_to request.referer
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_to request.referer
  end

  def index
    @favorited_posts = current_user.favorited_posts.page(params[:page]).per(12)
    # Userモデルでお気に入り一覧が見れるように絞り込んだので、↑でちょっとコントロールしてやった。
  end
end
