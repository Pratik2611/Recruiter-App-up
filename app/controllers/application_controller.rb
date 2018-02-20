class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  def after_sign_in_path_for(resource)
    homes_path
  end

  def after_sign_up_path_for(resource)
    user_session_path
  end

  def after_sign_out_path_for(resource)
    user_session_path
  end
  end
