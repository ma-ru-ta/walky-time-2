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
    redirect_to new_user_registration_path if !@user
  end

end
