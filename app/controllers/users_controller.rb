class UsersController < ApplicationController
  # render new.rhtml
  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      redirect_to(new_session_path)
      flash[:notice] = "Thanks for signing up!"
    else
      flash[:notice]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end

  def update_password
      if User.authenticate(current_user.login, params[:old_password])
          if ((params[:password] == params[:password_confirmation]) && !params[:password_confirmation].blank?)
              current_user.password_confirmation = params[:password_confirmation]
              current_user.password = params[:password]
              
              if current_user.save!
                  flash[:notice] = "Password successfully updated"
                  redirect_to login_path
              else
                  flash[:notice] = "Password not changed"
                  redirect_to login_path
              end
                
          else
              flash[:notice] = "New Password mismatch" 
              redirect_to login_path
          end
      else
          flash[:notice] = "Old password incorrect" 
          redirect_to login_path
      end
  end

end
