class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone
      t.integer :status, null: false, default: 0 
      t.text :comments
      t.integer :company_id
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
