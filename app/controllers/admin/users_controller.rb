class Admin::UsersController < ApplicationController
  include SessionsHelper
  include UsersHelper
  before_action :load_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user
  before_action :admin_user, only: [:index, :destroy, :edit, :update]
  before_action :correct_user,  only: [:edit, :update]

  def index
    @users = User.paginate page: params[:page]
  end

  def show
    @activities = @user.activities.paginate page: params[:page]
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t '.success'
      redirect_to @user
    else
      render :edit
    end
  end

  def	destroy
    @user.destroy
    flash[:success] = t '.success'
    redirect_to admin_users_url
  end


  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
