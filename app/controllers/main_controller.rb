class MainController < ApplicationController

  def index

  end
  
  def tweet
    
    current_user.twitter.update(params[:text])
    flash[:notice] ="Tweeted #{params[:text]}"
    
    render :index
  end
  
end
