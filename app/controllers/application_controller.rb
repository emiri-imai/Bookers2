class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top,:show]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(id: current_user)
  end

def autheniticate_user
  if current_user==nil
    redirect_to root_path
  end
end


  protected

  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
