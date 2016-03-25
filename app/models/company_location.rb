class CompanyLocation < ActiveRecord::Base
    delegate :city, to: :location, prefix: true
    delegate :state, to: :location, prefix: true
    delegate :zip, to: :location, prefix: true
    belongs_to :location
    belongs_to :company
    validates :location_id, presence: true
    validates :company_id, presence: true
end
