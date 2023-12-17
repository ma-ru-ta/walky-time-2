class Public::SessionsController < Devise::SessionsController
  
  before_action :user_state, only: [:create]

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  
  def user_state
    @user = User.find_by(email: params[:user][:email])
    return if !@user
    if @user.valid_password?(params[:user][:password]) && @user.is_active == false
    flash[:notice] = "退会済みのため再登録が必要となります。"
    redirect_to new_user_registration_path
    end
  end

end
