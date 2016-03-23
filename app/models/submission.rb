class Submission < ActiveRecord::Base
  
  belongs_to :job
  belongs_to :candidate
  validates :user_id, presence: true
  validates :job_id, presence: true
  validates :candidate_id, presence: true
end
