class UsersController < ApplicationController
  load_and_authorize_resource

  def show; end

  def edit; end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :tel)
    end
end
