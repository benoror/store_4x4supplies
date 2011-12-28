# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def authorized_logged_in?
    logged_in? and current_user.login == "benoror"
  end

end
