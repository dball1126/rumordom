class ChangeTable < ActiveRecord::Migration[5.1]
  def change
    change_table :experiences do |t|
       
       t.timestamps null: true
    end
  end
end
