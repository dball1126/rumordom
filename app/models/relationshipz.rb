class Relationshipz < ApplicationRecord
  belongs_to :followerz, class_name: "User"
  belongs_to :followedz, class_name: "Business"
  validates  :followerz_id, presence: true
  validates  :followedz_id, presence: true
    
end
