class UsersController < ApplicationController
  load_and_authorize_resource

  def index; end

  def show; end

  def new; end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path notice: '登録に成功しました' }
      else
        format.html { render :new, notice: '登録に失敗しました' }
      end
    end
  end

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
