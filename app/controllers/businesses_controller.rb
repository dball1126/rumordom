class BusinessesController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :set_business, only: [:show, :edit, :update, :destroy]
  require 'will_paginate/array'
  
  def index
    load_businesses
    @businesses = Business.paginate(page: params[:page])
    respond_to do |format|
      format.html
      format.csv { send_data @businesses.to_csv(['name', 'city', 'state', 'zipcode', 'address1', 'address2', 'category1_id', 'category2_id', 'category3_id', 'category1', 'category2', 'category3', 'phone', 'website', 'latitude', 'longitude']) }
    end
   # if params[:search]
  #    @businesses = Business.search(params[:search]).order("created_at DESC")
   # else
    #  @businesses = Business.all.order("created_at DESC")
    #end
  end

  def import
    Business.import(params[:file])
    redirect_to root_url, notice: "Businesses imported."
  end


  def new
    @business = Business.new
    #@experience = Experience.new
  end

  def create
    @business = Business.new(business_params)
    #if @business.save
     # flash[:success] = "Business saved!"
      #redirect_to @business
  #  else
   #   flash[:alert] = "Business not saved!"
    #  render 'new'
    #end
    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Business was successfully created.' }
        format.json { render :show, status: :created, location: @business }
      else
        format.html { render :new }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
    
  end

  def show
    
    
    @businessz = Business.paginate(page: params[:page])
    #redirect_to root_url and return unless @user.activated?
    
    @experiences = Experience.where(business_id: @business)
    @reviews = Review.where(business_id: @business)
    #@experiences = @user.experiences.paginate(page: params[:page])
    #@reviews = @user.reviews.paginate(page: params[:page])
    
  end

  def followerzs
    @title = "Followerzs"
    @business = Business.find(params[:id])
    @businesses = @business.followerzs.paginate(page: params[:page])
    render 'show_followz'
  end

  def search
    
    #@businessz  = Business.search(params)
    @businesses = Business.search(params)
   # Business.within(
  #  params[:radius],
  #  :units => :miles,
  #  :origin => [params[:lat], params[:lng]]
  #)
    load_businessz
  end
  
  def load_businesses 
   @businesses_default = Gmaps4rails.build_markers(Business.paginate(page: params[:page])) do |plot, marker|  
      marker.lat plot.latitude  
      marker.lng plot.longitude  

      @status = rand(1..4)  
      @battery = rand(10..90)  
      @ip = "192.168."+rand(0..255).to_s+"."+rand(15..250).to_s  
      @connected = rand(50..100)  

      if @status == 1  
        url_alert = "/assets/good.png"
        @status == "Normal"  
      else  
        url_alert = "/assets/alert.png" 
      end  

      marker.picture({:picture => "http://mapicons.nicolasmollet.com/     wp-content/uploads/mapicons/shape-default/color-3875d7/shapeco     lor-color/shadow-1/border-dark/symbolstyle-contrast/symbolshad     owstyle-dark/gradient-iphone/information.png",
                    :width => 32,
                    :height => 32})

      marker.infowindow render_to_string(:partial => "/businesses/info",   
        :locals => {:name => plot.name, :battery => @battery, :date => rand(6.months.ago..Time.now), :ip => @ip, :connected => @connected, :address1 => plot.address1, :city => plot.city })  
   end  
 end
  
  def load_businessz
    
   @businessz_default = Gmaps4rails.build_markers(@businesses.paginate(page: params[:page])) do |plot, marker|  
      marker.lat plot.latitude  
      marker.lng plot.longitude  

      @status = rand(1..4)  
      @battery = rand(10..90)  
      @ip = "192.168."+rand(0..255).to_s+"."+rand(15..250).to_s  
      @connected = rand(50..100)  

      if @status == 1  
        url_alert = "/assets/good.png"
        @status == "Normal"  
      else  
        url_alert = "/assets/alert.png" 
      end  

      marker.picture({:picture => "http://mapicons.nicolasmollet.com/     wp-content/uploads/mapicons/shape-default/color-3875d7/shapeco     lor-color/shadow-1/border-dark/symbolstyle-contrast/symbolshad     owstyle-dark/gradient-iphone/information.png",
                    :width => 32,
                    :height => 32})

      marker.infowindow render_to_string(:partial => "/businesses/infoz",   
        :locals => {:name => plot.name, :battery => @battery, :date => rand(6.months.ago..Time.now), :ip => @ip, :connected => @connected, :city => plot.city, :state => plot.state, :address1 => plot.address1, :zipcode => plot.zipcode, :id => plot.id })  
   end  
 end
 
  
  private
  
  
  def set_business
      @business = Business.find(params[:id])
    end
  
  def mapping_params
    params.require(:business).permit(:name, :full_address, :address1, :city, :state, :zipcode, :latitude, :longitude)
  end
  
  def business_params
    params.require(:business).permit(:name, :city, :state, :zipcode, :address1, :address2, :category1_id, :category2_id, :category3_id, :category1, :category2, :category3, :phone, :website, :latitude, :longitude)
  end
  # added correct user admin user for business 4 29 18
  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

  #def logged_in_user
   # unless logged_in?
    #  store_location
     #   flash[:danger] = "Please log in."
      #  redirect_to login_url
  #  end
  #end
end