class AddStuffCodeToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :stuff_code, :integer
  end
end
