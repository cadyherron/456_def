class ProgressReport < ActiveRecord::Base

  belongs_to :author, foreign_key: :employee_id
  belongs_to :team

end
