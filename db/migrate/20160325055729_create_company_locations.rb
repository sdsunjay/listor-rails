class CreateCompanyLocations < ActiveRecord::Migration
  def change
    create_table :company_locations do |t|
      t.belongs_to :location, index: true
      t.belongs_to :company, index: true
      t.string :name
      t.timestamps null: false
    end
  end
end
