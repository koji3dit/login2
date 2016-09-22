class CreateSimeis < ActiveRecord::Migration
  def change
    create_table :simeis do |t|
      t.string :name_sei
      t.string :name_mei
      t.string :kname_sei
      t.string :kname_mei

      t.timestamps null: false
    end
  end
end
