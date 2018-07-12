class Review < ApplicationRecord
  belongs_to :user, :class_name => "User"
  belongs_to :business, :class_name => "User", optional: true
  validates :user_id, presence: true
  #validates :business_id, presence: true
  #validates :content, presence: true, length: { maximum: 500 }
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validate :picture_size
  
  
  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
  
end
