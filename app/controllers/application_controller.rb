# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  def authorized_login_required
    (if current_user.login == "benoror"
      true
    else
      flash[:notice] = "No tienes acceso a esta seccion"
      false
    end) || access_denied
  end

end
