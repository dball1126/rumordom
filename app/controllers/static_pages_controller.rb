class StaticPagesController < ApplicationController
  def home
    if logged_in?
    @experience = current_user.experiences.build if logged_in?
    @review = current_user.reviews.build
    @feed_items = current_user.feed.paginate(page: params[:page])
    @feedz_items = current_user.feedz.paginate(page: params[:page])
    end
  end
  
  def help
  end
  
  def contact
  end
  
  def about
  end
  
  def user_feed
    if logged_in?
    @experience = current_user.experiences.build
    @review = current_user.reviews.build
    @feed_items = current_user.feed.paginate(page: params[:page])
    @feedz_items = current_user.feedz.paginate(page: params[:page])
    end
  end
end