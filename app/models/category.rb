class Category < ActiveRecord::Base
  #has_many :businesses
  has_and_belongs_to_many :businesses
end