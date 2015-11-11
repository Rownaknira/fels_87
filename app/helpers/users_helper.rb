module UsersHelper
  def correct_user
    @user = User.find params[:id]
    redirect_to root_url unless current_user?(@user)
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end

  def load_user
    @user = User.find params[:id]
  end

  def following
    @title = t.('Following_title')
    @user  = User.find params[:id]
    @users = @user.following.paginate(page: params[:page])
  end

  def followers
    @title = t.('Followers_title')
    @user  = User.find params[:id]
    @users = @user.followers.paginate(page: params[:page])
  end
end
