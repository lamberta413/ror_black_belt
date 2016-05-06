class SessionsController < ApplicationController

  def create
    user = User.find_by(:email => params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/ideas'
    else
      flash[:error] = "Please input into all fields"
      redirect_to '/sessions/new'
  end

  def destroy
    reset_session
    redirect_to '/'
  end

end
end
