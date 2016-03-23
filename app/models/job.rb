class Job < ActiveRecord::Base
  
  has_many :submissions
  has_many :candidates, through: :submissions
  accepts_nested_attributes_for :submissions

  belongs_to :user
  belongs_to :company

  validates :title, presence: true
  validates :user_id, presence: true
  validates :company_id, presence: true
end
