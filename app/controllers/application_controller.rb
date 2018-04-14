class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  layout :layout_by_resource
  protected
  def layout_by_resource
		if devise_controller? && resource_name == :admin_user
      		"devise"
    	else
			"application"
		end
	end
	 def after_sign_in_path_for(resource)
      admin_home_index_path
      
  end

  def after_sign_out_path_for(resource)
      new_admin_user_session_path
    
  end
end
