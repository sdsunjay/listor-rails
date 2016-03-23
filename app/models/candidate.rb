class Candidate < ActiveRecord::Base
  
  belongs_to :user
  has_many :submissions
  has_many :jobs, through: :submissions
  accepts_nested_attributes_for :submissions
  
  enum status: {
    needs_approval: 0,
    needs_feedback: 1,
    needs_interview: 2,
    final_stages: 3
  }
  validates :name, presence: true
  validates :email, presence: true
  validates :status, presence: true
  validates :user_id, presence: true
end
