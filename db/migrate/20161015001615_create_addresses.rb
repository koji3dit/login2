class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.belongs_to :profile, index: true, foreign_key: true
      #t.belongs_to :address_master, index: true, foreign_key: true

      t.string :postal_code,        null: false
      t.string :prefectural,        default: ""
      t.string :city,               default: ""
      t.string :street,             default: ""
      t.string :building,           default: ""
      t.string :type

      t.timestamps null: false
    end
  end
end
