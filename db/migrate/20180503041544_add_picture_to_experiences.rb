class AddPictureToExperiences < ActiveRecord::Migration[5.1]
  def change
    add_column :experiences, :picture, :string
  end
end
