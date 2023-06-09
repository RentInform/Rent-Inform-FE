class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    google_id = auth_hash['uid']
    email = auth_hash['info']['email']
    token = auth_hash['credentials']['token']

    user = User.find_or_create_by(email: email)
    user.update(google_id: google_id, token: token)

    session[:user_id] = user.id

    redirect_to '/dashboard'
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  def new; end
end