class Job < ActiveRecord::Base

  has_many :submissions
  has_many :candidates, through: :submissions
  belongs_to :user
  belongs_to :company
  validates :title, presence: true
end
