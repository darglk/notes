class Admin::UsersController < Admin::ApplicationController
  before_action :set_user, only: [ :show, :edit, :destroy, :update]

  def index
    @users = User.all
  end

  def show

  end

  def edit

  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.js
      else
        format.js { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.js
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :is_admin)
  end
end