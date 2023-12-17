class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      @posts = Post.all
      render :index
    end
  end

  def index
    @prefectures = Prefecture.all
    if params[:prefecture]
      @posts = Post.where(prefecture_id: params[:prefecture]).page(params[:page])
    else
      @posts = Post.page(params[:page])
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = Comment.new
  # コメントのIDではなく、Postに関連するコメントを取得する
    @comments = @post.comments
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to posts_path
  end

  # showアクションと同じでどの投稿を依頼済みにするか
  def switch_on
    @post = Post.find(params[:id])
    @post.update(active_status: false)
    redirect_back(fallback_location: root_path)
  end

  def switch_off
    @post = Post.find(params[:id])
    @post.update(active_status: true)
    redirect_back(fallback_location: root_path)
  end

  private

  def post_params
    params.require(:post).permit(:dog_name, :dog_type, :dog_sex, :day, :prefecture_id, :city, :post_body, :post_image)
  end
end
