class AddCategoryIndexToBusinesses < ActiveRecord::Migration[5.1]
  def change
    add_reference :businesses, :category1, index: true
    add_reference :businesses, :category2, index: true
    add_reference :businesses, :category3, index: true
  end
end
