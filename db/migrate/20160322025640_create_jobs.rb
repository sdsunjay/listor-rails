class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.integer :user_id
      t.text :description
      t.integer :salary
      t.integer :company_id
      t.integer :candidate_id
      t.integer :status

      t.timestamps null: false
    end
  end
end
