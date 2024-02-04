class Public::PostsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :switch_on, :switch_off]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @prefectures = Prefecture.all
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
      flash[:notice] = '新規投稿されました！'
    else
      @posts = Post.page(params[:page]).per(12)  # ページネーション用に @posts を設定
      flash[:notice] = '入力されていない箇所があったため投稿できません。'
      redirect_to request.referer
    end

  end

  def index
    @prefectures = Prefecture.all
    if params[:prefecture]
      @posts = Post.where(prefecture_id: params[:prefecture]).page(params[:page]).per(12)
    else
      @posts = Post.page(params[:page]).per(12)
    end
  end


  def show
    # @post = Post.find(params[:id])
    @post_comment = Comment.new
  # コメントのIDではなく、Postに関連するコメントを取得する
    @comments = @post.comments
  end

  def edit; end

  def update
    # @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  # showアクションと同じでどの投稿を依頼済みにするか
  def switch_on
    # @post = Post.find(params[:id])
    @post.update(active_status: false)
    redirect_back(fallback_location: root_path)
  end

  def switch_off
    # @post = Post.find(params[:id])
    @post.update(active_status: true)
    redirect_back(fallback_location: root_path)
  end

  private

  def post_params
    params.require(:post).permit(:dog_name, :dog_type, :dog_sex, :day, :prefecture_id, :city, :post_body, :post_image)
  end

  def set_user
    @post = Post.find(params[:id])
  end
end
