class Experience < ActiveRecord::Base
    #belongs_to :comment, :polymorphic => true
    belongs_to :user
    belongs_to :business
    #added below 4 29 18
    default_scope -> { order(created_at: :desc) }
    mount_uploader :picture, PictureUploader
    validates :user_id, presence: true
    validates :comment, presence: true, length: { maximum: 130 }
    validate  :picture_size   
    
    private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end