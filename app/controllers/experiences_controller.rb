class ExperiencesController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :destroy]
  before_action :correct_user,   only: :destroy
  before_action :set_business,   except: :destroy
  
  #added except :destory 5 4 18
  
  
  def new
    @experience = Experience.new(business: @business)
  end
  
  def create
    @experience = current_user.experiences.build(experience_params)
    @experience.business = @business
    #@host = Business.find_by(@experience.business_id)
    #@experience.save
    if @experience.save
      flash[:success] = "Experience created!"
    redirect_to @business
    else 
      @feed_items = []
      @feedz_items = []
    render 'static_pages/home'
    end
  end
  
  def destroy
    @experience.destroy
    flash[:success] = "Experience deleted"
    redirect_to request.referrer || root_url
  end
  
  private
  
  def experience_params
    params.require(:experience).permit(:comment, :picture)
  end
  #Added correct user before action and private 4 25 2018
  def correct_user
      @experience = current_user.experiences.find_by(id: params[:id])
      redirect_to root_url if @experience.nil?
      
  end
  
  
  def set_business
    @business = Business.find(params[:business_id])
  end
end