class CreateStreets < ActiveRecord::Migration[6.0]
  def change
    create_table :streets do |t|
      t.string     :postal_code,      null: false
      t.integer    :delivery_area_id, null: false
      t.string     :municipality,     null: false
      t.string     :address,          null: false
      t.string     :phone_number,     null: false
      t.string     :building
      t.references :order,            foreign_key: true 
      t.timestamps
    end
  end
end