class ApplicationController < ActionController::Base
  protect_from_forgery
      layout :layout_by_resource

  def layout_by_resource
    if devise_controller? and controller_name != "users"
      "devise"
    else
      "application"
    end
  end
end
