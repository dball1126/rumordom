class Business < ApplicationRecord
  require 'csv'
  has_many   :experiences
  has_many   :reviews
  #belongs_to :category #added 5 14 18, class_name: "Person", optional: true
  has_and_belongs_to_many :categories
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :city
  validates_presence_of :state
  
  has_many :passive_relationshipzs, class_name:  "Relationshipz",
                                   foreign_key: "followedz_id",
                                   dependent:   :destroy
  has_many :followerzs, through: :passive_relationshipzs, source: :followerz
  
  validates_presence_of :full_address
  validates_presence_of :category1_id
  validates_presence_of :category2_id
  validates_presence_of :category3_id
  before_save :category1_id
  before_save :category2_id
  before_save :category2_id
  
  
  geocoded_by :full_address
  after_validation :geocode
  
  mount_uploader :image, ImageUploader
  
  
  
  # Follows a Business.
#  def followz(other_business)
#    followingz << other_business
#  end

  # Unfollows a business.
#  def unfollowz(other_business)
#    followingz.delete(other_business)
#  end

  # Returns true if the current user is following the other user.
#  def followingz?(other_business)
#    followingz.include?(other_business)
#  end
 
  def self.import(file)
     CSV.foreach(file.path, headers: true) do |row|
     Business.create! row.to_hash
     end
  end
  
#  def category1_id
#    list_arr=[]
#    Category.all.to_a.each {|x| list_arr << x.name }
#    if list_arr.include?(category1)
#      i=0
#      list_arr.each{|x| 
#      if x == category1
#        i
#      else
#        i+=1
#      end }
#      i
#    else
#      item = Category.new
#      item.name = category1
#      item.save
#      item.id
#    end
#  end
  
#  def category2_id
#    list_arr=[]
#    Category.all.to_a.each {|x| list_arr << x.name }
#    if list_arr.include?(category2)
#      i=0
#      list_arr.each{|x| 
#      if x == category2
#        i
#      else
#        i+=1
#      end }
#      i
#    else
#      item = Category.new
#      item.name = category2
#      item.save
#      item.id
#    end
#  end
  
#  def category3_id
#    list_arr=[]
#    Category.all.to_a.each {|x| list_arr << x.name }
#    if list_arr.include?(category3)
#      i=0
#      list_arr.each{|x| 
#      if x == category3
#        i
#      else
#        i+=1
#      end }
#      i
#    else
#      item = Category.new
#      item.name = category3
#      item.save
#      item.id
#    end
#  end
  
  
  
  
  
  def full_address
    [address1, city, state, zipcode].join(', ')
  end
  
  def self.search(params)
    #businesses = Business.where(category_id: params[:category].to_i)
  businesses = Business.where("name like ? or description like ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    businesses = businesses.near(params[:location], 20) if params[:location].present?
    businesses
  end
end