# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [ :create ]
  before_action :configure_account_update_params, only: [ :update ]

  def create
    build_resource(sign_up_params)
    if resource.save
      sign_in(resource)
      respond_with resource, location: after_sign_up_path_for(resource)
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_with_email_confirmation(user_params)
      redirect_to root_path, notice: "メールアドレスの変更を確認してください。"
    else
      render :edit
    end
  end

  protected

  def user_params
    params.require(:user).permit(:email)
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :email ])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :email ])
  end

  def after_sign_up_path_for(resource)
    super(resource)
  end

  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end
end
