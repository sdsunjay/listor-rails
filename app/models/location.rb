class Location < ActiveRecord::Base
    belongs_to :company
    has_many :company_locations
    has_many :companies, through: :company_locations
    accepts_nested_attributes_for :company_locations
    validates :city, presence: true
    validates :state, presence: true
    validates :zip, presence: true
end
