class CreateAddressMasters < ActiveRecord::Migration
  def change
    create_table :address_masters do |t|
      t.string :postal_code,        null: false
      t.references :prefectural,    index: true
      t.string :city,               default: ""
      t.string :street,             default: ""

      #t.timestamps null: false
    end
  end
end
