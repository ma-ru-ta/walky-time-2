class Admin::UsersController < ApplicationController

  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
    if @user.nil?
      # もしユーザーが存在しない場合の処理を追加
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "会員情報を更新しました。"
    else
      render :edit
    end
  end

  def withdrw

  end


  protected

  def user_params
    params.require(:user).permit(:real_name,
                                 :user_name,
                                 :postal_code,
                                 :address,
                                 :telephone_number,
                                 :introduction,
                                 :is_active
                                 )
  end

end
