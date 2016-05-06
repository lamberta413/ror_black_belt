class UsersController < ApplicationController

  def create
    if params[:password]== params[:confirm_password]
    @users = User.create(name:params[:name], alias: params[:alias], email: params[:email], password:params[:password], password_confirmation: params[:confirm_password])
    if @users.errors.full_messages.any?
      flash[:errors] = @users.errors.full_messages
    else
      flash[:notice] = 'User created. Please log in.'
    end
  else
    flash[:notice] = 'passwords did not match. please try again.'
  end
    redirect_to :back
  end

  def show
    @user = User.find(params[:id])
  end

end
