class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resouce)
  	case resouce
  	when Admin
  		admins_users_path

  	when User
  		user_path(resouce)
  	end
  end
  def after_sign_up_path_for(resouce)
  	case resouce
  	when Admin
  		admins_users_path

  	when User
  		user_path(resouce)
  	end
  end
  def after_sign_out_path_for(resouce)
  	root_path
  end
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :introduction, :image_id, :user_status, :withdrawal_status])
  end
end
