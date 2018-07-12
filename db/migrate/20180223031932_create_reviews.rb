class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :business, foreign_key: true

      t.timestamps
    end
    add_index :reviews, [:user_id, :created_at]
    add_index :reviews, [:business_id, :created_at]
  end
end
