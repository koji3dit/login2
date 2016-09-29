class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
      t.index [:user_id, :created_at]
    end
  end
end
