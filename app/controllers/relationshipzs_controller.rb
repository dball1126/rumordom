class RelationshipzsController < ApplicationController
  before_action  :logged_in_user
  
  def create
    @business = Business.find(params[:followedz_id])
    current_user.followz(@business)
    respond_to do |format|
      format.html { redirect_to @business }
      format.js
    end
  end
  
  def destroy
    @business = Relationshipz.find(params[:id]).followedz
    current_user.unfollowz(@business)
    respond_to do |format|
      format.html { redirect_to @business }
      format.js
   end 
  end
end