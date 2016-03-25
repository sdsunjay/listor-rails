class Skill < ActiveRecord::Base
  has_many :candidate_skills
  has_many :candidates, through: :candidate_skills
  accepts_nested_attributes_for :candidate_skills
end
