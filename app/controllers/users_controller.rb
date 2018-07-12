class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                        :following, :followers, :followingz]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  
  def index
    @users = User.where(activated: true).paginate(page: params[:page])
    #@users = User.paginate(page: params[:user])
  end
  
  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.paginate(page: params[:page])
    @experiences = @user.experiences.paginate(page: params[:page])
    redirect_to root_url and return unless @user.activated?
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  
    def new
      @user = User.new
    end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end
  

  # # Follows a user.
  #def follow(other_user)
  #  following << other_user
  #end

  # Unfollows a user.
  #def unfollow(other_user)
  #  following.delete(other_user)
  #end

  # Returns true if the current user is following the other user.
  #def following?(other_user)
  #  following.include?(other_user)
  #end

  

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
  def followingz
    @title = "Followingz"
    @user = User.find(params[:id])
    @users = @user.followingz.paginate(page: params[:page])
    render 'show_followz'
  end
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
   #  Confirms a logged-in user.
  #  def logged_in_user
   #   unless logged_in?
    #  store_location
    #    flash[:danger] = "Please log in."
     #   redirect_to login_url
    #  end
  #  end
    
    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    
end