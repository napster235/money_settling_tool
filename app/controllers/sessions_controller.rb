class SessionsController < Devise::SessionsController

  def destroy
    super
     # redirect_to login_path
  end

end
