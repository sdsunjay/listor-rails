class Note < ActiveRecord::Base
      belongs_to :candidate
      belongs_to :jobs
      belongs_to :company
      validates :body, presence: true
      validates :user_id, presence: true
end
