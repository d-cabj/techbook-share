class Users::SessionsController < Devise::SessionsController
before_action :configure_sign_in_params, only: [:create]

  # 以下、deviseのgithubから拾ったコードを修正

  # GET /resource/sign_in
  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?
    # respond_with(resource, serialize_options(resource))
    render :new
  end

  # POST /resource/sign_in
  def create
    # binding.pry
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    redirect_to :back
    # respond_with resource, location: after_sign_in_path_for(resource)
  end

  # DELETE /resource/sign_out
  def destroy
    # binding.pry
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message! :notice, :signed_out if signed_out
    yield if block_given?
    # respond_to_on_destroy
    redirect_to root_path
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname, :password, :remember_me])
  end
end
