class Devise::SessionsController < DeviseController
  prepend_before_filter :require_no_authentication, :only => [ :new, :create ]
  prepend_before_filter :allow_params_authentication!, :only => [ :new, :create ]
  skip_before_filter :verify_authenticity_token
  layout "devise"

  # GET /resource/sign_in
  def new
    resource = build_resource
    clean_up_passwords(resource)
    respond_with(resource, serialize_options(resource))
  end

  # POST /resource/sign_in
  def create
    if signed_in?
      if current_user.active 
        resource = warden.authenticate!(auth_options)
        set_flash_message(:notice, :signed_in) if is_navigational_format?
        sign_in(resource_name, resource)
        if current_user.role.super_admin
          session[:promp_company] = true
          session[:promp_branch] = true
        elsif current_user.role.company_admin
          session[:promp_company] = false
          session[:promp_branch] = true
        else
          session[:promp_company] = false
          session[:promp_branch] = false
        end
        if request.format == "application/json"
          render :json => current_user
        else
          respond_with resource, :location => after_sign_in_path_for(resource)
        end
      else
        sign_out(current_user)
        redirect_to new_user_session_path, :alert => t("errors.messages.account_inactive")
      end
    else
      redirect_to new_user_session_path, :alert => t("devise.failure.invalid")
    end
  end  

  # DELETE /resource/sign_out
  def destroy
    redirect_path = after_sign_out_path_for(resource_name)
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message :notice, :signed_out if signed_out
    respond_to do |format|
      format.any(*navigational_formats) { redirect_to redirect_path }
      format.all do
        method = "to_#{request_format}"
        text = {}.respond_to?(method) ? {}.send(method) : ""
        render :text => text, :status => :ok
      end
    end    
  end

  protected

  def serialize_options(resource)
    methods = resource_class.authentication_keys.dup
    methods = methods.keys if methods.is_a?(Hash)
    methods << :password if resource.respond_to?(:password)
    { :methods => methods, :only => [:password] }
  end

  def auth_options
    { :scope => resource_name, :recall => "#{controller_path}#new"}  
  end
  
  def after_sign_in_path_for(resource)
    root_path
  end

end