class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]  #, except: [:top, :about]を追加
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_in_path_for(resource)
    user_path(resource)    #root_path、(resource)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
