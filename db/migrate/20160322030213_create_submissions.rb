class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :job_id, null: false
      t.integer :candidate_id, null: false
      t.integer :user_id, null: false
      t.integer :status, null: false, default: 0 

      t.timestamps null: false
    end
  end
end
