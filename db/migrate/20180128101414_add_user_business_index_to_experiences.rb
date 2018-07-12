class AddUserBusinessIndexToExperiences < ActiveRecord::Migration[5.1]
  def change
    
    add_reference :experiences, :business, index: true
    add_reference :experiences, :user, index: true
    
  end
end
