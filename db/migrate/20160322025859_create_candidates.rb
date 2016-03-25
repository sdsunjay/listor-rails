class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone
      t.string :about
      t.string :linkedin_link
      t.string :facebook_link
      t.string :image
      t.integer :status, null: false, default: 0 
      t.integer :company_id
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
