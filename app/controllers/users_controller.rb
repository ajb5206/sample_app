class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # send to chosen view
    else
      render "new", status: :unprocessable_entity
    end
  end

  private

    def user_params
      params.requre(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
