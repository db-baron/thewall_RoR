class UsersController < ApplicationController
  def new
  end

  def login
    ### Both of these find_by lines of code work for logging in ###
    # @user = User.find_by_username(params[:username])
    @user = User.find_by(username: params[:username])

    # user = User.create(username: params[:username])
    if @user
       session[:user_id] = @user.id
       redirect_to "/messages"
    else
        render text: "Invalid login"  # There will be errors if you get into the else
    end
  end

  def logout
      reset_session
      redirect_to "/"
  end

end
