class CreateRelationshipzs < ActiveRecord::Migration[5.1]
  def change
    create_table :relationshipzs do |t|
      t.integer :followerz_id
      t.integer :followedz_id

      t.timestamps
    end
    add_index :relationshipzs, :followerz_id
    add_index :relationshipzs, :followedz_id
    add_index :relationshipzs, [:followerz_id, :followedz_id], unique: true
  end
end
