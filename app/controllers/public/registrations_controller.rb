class Public::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # def new
  # end

  # def create
  # end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :real_name, :user_name,
      :postal_code, :address, :telephone_number,
      :introduction
    ])
  end
  
  def ensure_normal_user
    if resource.email == 'guest@example.com'
      flash.now[:notice] = "ゲストユーザーの削除はできません。"
      redirect_to root_path
    end
  end
    
end
