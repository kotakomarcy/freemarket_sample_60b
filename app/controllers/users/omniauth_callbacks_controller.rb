# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  def facebook
    authorization(:facebook)
  end

  def google_oauth2
    authorization(:google)
  end

  def failure
    redirect_to root_path
  end

  private

  def authorization(provider)
    sns_info = User.from_omniauth(request.env["omniauth.auth"])
    @user = sns_info[:user]

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
    else
      @sns_id = sns_info[:sns]
      session[:provider] = @sns_id[:provider]
      session[:uid] = @sns_id[:uid]
      render template: 'devise/registrations/new'
    end
  end
end
