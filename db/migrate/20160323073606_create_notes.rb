class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :candidate_id
      t.integer :company_id
      t.integer :job_id
      t.integer :user_id, null: false
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
