class ApplicationController < ActionController::Base
  
  include SessionsHelper
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to root_path
    end
  end
  
  def set_layout_difference
    @special_twitter = nil
  end
end
