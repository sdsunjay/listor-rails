class CreateCandidateSkills < ActiveRecord::Migration
  def change
    create_table :candidate_skills do |t|
      t.integer :user_id, null: false
      t.integer :candidate_id, null: false
      t.integer :skill_id, null: false

      t.timestamps null: false
    end
  end
end
