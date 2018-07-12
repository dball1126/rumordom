class AddPictureToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :picture, :string
  end
end
