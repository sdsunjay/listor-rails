class Company < ActiveRecord::Base
validates :name, presence: true
    has_many :users
    has_many :jobs
    has_many :notes, dependent: :destroy  
    has_many :locations
    has_many :company_locations
    has_many :locations, through: :company_locations
    accepts_nested_attributes_for :company_locations

    # validates :location_id, presence: true
end
