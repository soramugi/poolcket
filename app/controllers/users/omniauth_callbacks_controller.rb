class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def pocket
    @user = User.find_or_create_by(user_params)

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message( :notice, :success, kind: 'Pocket' ) if is_navigational_format?
    else
      session['devise.pocket_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  private
  def user_params
    auth = request.env['omniauth.auth']
    { provider: auth.provider, token: auth.credentials.token }
  end
end
