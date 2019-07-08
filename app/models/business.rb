class Business < ApplicationRecord
  require 'csv'
 acts_as_mappable :default_units => :miles,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude
  has_many   :experiences
  has_many   :reviews
  #belongs_to :category #added 5 14 18, class_name: "Person", optional: true
  has_and_belongs_to_many :categories
  validates_presence_of :name
  validates_presence_of :city
  validates_presence_of :state
  
  has_many :passive_relationshipzs, class_name:  "Relationshipz",
                                   foreign_key: "followedz_id",
                                   dependent:   :destroy
  has_many :followerzs, through: :passive_relationshipzs, source: :followerz
  
  validates_presence_of :full_address
  #validates_presence_of :dup_name
  
  validates_presence_of :category1_id
  validates_presence_of :category2_id
  validates_presence_of :category3_id
  before_save :category1_id
  before_save :category2_id
  before_save :category2_id
  
  #before_save :duplicate_check
  
  before_save :geocode_address
  after_validation :geocode_address, :if => :address1_changed?
  #geocoded_by :full_address
  #Geokit::Geocoders::GoogleGeocoder.geocoded_by :full_address
  #after_validation :Geokit::Geocoders::GoogleGeocoder.geocode
  #after_validation :geocode
  
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

=begin
  def category1_id
    list_arr=[]
    Category.all.to_a.each {|x| list_arr << x.name }
   if list_arr.include?(category1)
      i=0
      list_arr.each{|x| 
      if x == category1
        i
      else
        i+=1
      end }
      i
    else
      item = Category.new
      item.name = category1
      item.save
      item.id
    end
  end
  
  def category2_id
    list_arr=[]
    Category.all.to_a.each {|x| list_arr << x.name }
    if list_arr.include?(category2)
      i=0
      list_arr.each{|x| 
      if x == category2
        i
      else
        i+=1
      end }
      i
    else
      item = Category.new
      item.name = category2
      item.save
      item.id
    end
  end
  
  def category3_id
    list_arr=[]
    Category.all.to_a.each {|x| list_arr << x.name }
    if list_arr.include?(category3)
      i=0
      list_arr.each{|x| 
      if x == category3
        i
      else
        i+=1
      end }
      i
    else
      item = Category.new
      item.name = category3
      item.save
      item.id
    end
  end
=end
  
  
  def routing1
    latitude
  end
  def routing2
    longitude
  end

  def full_address
    [address1, city, state, zipcode].join(', ')
  end
  
  
  
  # Finds within a distance radius.
        def find_within(distance, options={})
          options[:within] = distance
          find(:all, options)
        end
  
  
  def geocode_address
    
    if latitude == nil || longitude == nil
      geo = Geokit::Geocoders::MultiGeocoder.geocode full_address
      self.latitude, self.longitude = geo.lat,geo.lng
      self.save
    end
  end

# Checks whether this object has been geocoded or not. Returns the truth
def geocoded?
  lat? && lng?
end
  
  def self.search(params)
    #businesses = Business.where(category_id: params[:category].to_i)
    
    query = params[:search]
    location1 = params[:location]
    
   location1 = "brooklyn" if location1 == ""
      
  #  businesses = Business.where("name ilike ? and city ilike ? and state ilike ?", "%#{query}%", "%#{location}%", "%#{location}%") if query.present?
    

  
        if query != ""

            location1String = location1.split(' ').map do |string|
                string = "LOWER(city) LIKE '%#{string.downcase}%'" + (" OR ") + ("LOWER(state) LIKE '%#{string.downcase}%'")
            end.join(" OR ")
            
            location1Businesses = Business.where('(' + location1String + ')')

            queryString = query.split(' ').map do |string|
                string = "LOWER(name) LIKE '%#{string.downcase}%'"
            end.join(" OR ")
            businesses = location1Businesses.where('(' + queryString + ')')

          elsif query == ""
            
            location1String = location1.split(' ').map do |string|
                string = "LOWER(city) LIKE '%#{"new york"}%'" + (" AND ") + ("zipcode LIKE '%#{"10018"}%'")
            end.join(" OR ")
            
            businesses = Business.where('(' + location1String + ')')
          end

             if businesses.empty?
                 businesses
                
             else
              begin
              businesses = businesses.within(4, :origin => "#{location1}")
              businesses = businesses.sort_by{|x| x.distance_to("#{:location1}")}
              businesses
            rescue Geokit::Geocoders::GeocodeError
            print "Search results must be more specific"
            businesses
            end
            end
              
            end
        end


  #  if businesses == nil
  #   businesses = Business.where("city ilike ? or state ilike ?", "%#{location1}", "%#{location1}")
  #  end
    
    