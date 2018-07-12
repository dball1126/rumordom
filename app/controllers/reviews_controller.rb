class ReviewsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  before_action :set_businessz
  
  #def new
  #  @review = Review.new(business: @business)
  #end
  
  def create
    @review = current_user.reviews.build(review_params)   
    #@review.business = @business
    #@business.save
    #@review.save
    if @review.save
    flash[:success] = "Review created!"
     
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end
  
  def destroy
    @review.destroy
    flash[:success] = "Review deleted"
    redirect_to request.referrer || root_url
  end
  
  private
  
    def review_params
      params.require(:review).permit(:content, :picture)
    end
    
    def correct_user
      @review = current_user.reviews.find_by(id: params[:id])
      redirect_to root_url if @review.nil?
    end
    
    def set_businessz
      @business = Business.find(params[:business_id])
    end
    
end
