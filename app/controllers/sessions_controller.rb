class SessionsController < ApplicationController

  def create

    auth = request.env["omniauth.auth"]

    logger.info auth
    user = User.where(:provider => auth["provider"], :uid => auth["uid"]).first || User.create_with_omniauth(auth)

    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in!"
  end


  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end



  # routes here, if there has been a problem with the external authentication
  def failure
    @error = request.env["omniauth.auth"].to_yaml
  end
end
