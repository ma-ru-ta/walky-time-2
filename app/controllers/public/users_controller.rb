class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = current_user
    redirect_to root_path, notice: "不正な操作です。" and return unless User.find(params[:id]) == current_user
  end

  def update
    @user = current_user
    redirect_to root_path, notice: "不正な操作です。" and return unless User.find(params[:id]) == current_user
    if @user.update(user_params)
       redirect_to user_path
    else
      render 'edit'
    end
  end

  def check
  end

  def withdraw
    user = current_user
    reset_session
    user.destroy
    redirect_to new_user_registration_path
  end
    # 物理削除


  protected


  def user_params
    params.require(:user).permit(:real_name,
                                 :user_name,
                                 :postal_code,
                                 :address,
                                 :telephone_number,
                                 :introduction
                                 )
  end

end