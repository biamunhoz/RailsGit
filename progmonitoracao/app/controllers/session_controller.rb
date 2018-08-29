class SessionController < ApplicationController

  def new
    session[:usuario_id] = nil
  end

  def create
    user = Usuario.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to home_index_path
    else
      flash.now[:notice] = "Tente outra vez"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end

end
