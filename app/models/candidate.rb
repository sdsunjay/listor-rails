class Candidate < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :status, presence: true
  belongs_to :user
  has_many :submissions
  has_many :jobs, through: :submissions
end
