class RegistrationsController < Devise::RegistrationsController


  def create
    build_resource(sign_up_params)

    if resource.save
      yield resource if block_given?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      flash[:notice] = flash[:notice].to_a.concat resource.errors.full_messages
      redirect_to root_path(:failed => "y")
    end
  end


  protected

  def after_sign_up_path_for(resource)
    root_path
  end


  def after_inactive_sign_up_path_for(resource)
    root_path
  end

  private

  def sign_up_params
    params.require(resource_name).permit(:username, :email, :password, :first_name, :last_name)
  end
  def account_update_params
    params.require(:user).permit(:username, :email, :password, :first_name, :last_name)
  end
end
