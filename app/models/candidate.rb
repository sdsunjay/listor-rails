class Candidate < ActiveRecord::Base
  
  belongs_to :user
  has_many :submissions
  has_many :jobs, through: :submissions
  accepts_nested_attributes_for :submissions
  has_many :notes, dependent: :destroy  

  has_many :candidate_skills
  has_many :skills, through: :candidate_skills
  accepts_nested_attributes_for :candidate_skills

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


   has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
     validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
