class CandidateSkill < ActiveRecord::Base
  belongs_to :skill
  belongs_to :candidate
  validates :user_id, presence: true
  validates :skill_id, presence: true
  validates :candidate_id, presence: true
end
