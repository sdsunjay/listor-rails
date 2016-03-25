class Submission < ActiveRecord::Base
  
  belongs_to :job
  belongs_to :candidate
  validates :user_id, presence: true
  validates :job_id, presence: true
  validates :candidate_id, presence: true
  
  enum status: {
    needs_approval: 0,
    needs_feedback: 1,
    needs_interview: 2,
    final_stages: 3
  }
end
