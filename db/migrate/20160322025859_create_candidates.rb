class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.integer :status
      t.text :comments
      t.integer :company_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
