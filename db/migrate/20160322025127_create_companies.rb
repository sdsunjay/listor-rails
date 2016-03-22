class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :city
      t.text :notes

      t.timestamps null: false
    end
  end
end
