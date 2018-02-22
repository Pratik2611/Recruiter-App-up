class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters,if: :devise_controller?
  def after_sign_in_path_for(resource)
    @user_t = current_user
    #@user_type.user_type.to_s = "Recruiter"
    if  @user_t.user_type.to_s == "Recruiter"
        recruiters_show_path
    elsif @user_t.user_type.to_s == "Applicant"
      applicants_show_path
    else
    end
  end

  def after_sign_up_path_for(resource)
    user_session_path
  end

  def after_sign_out_path_for(resource)
    user_session_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:name,:email,:user_type,:password,:password_confirmation,:remember_created_at,:phone])
    devise_parameter_sanitizer.permit(:sign_in,keys:[:email,:password,:remember_created_at])
    devise_parameter_sanitizer.permit(:account_update,keys: [:email,:type,:phone,:password,:user_type])
  end
  end
