class Favorite < ApplicationRecord
    belongs_to :company
    belongs_to :user

    validates_uniqueness_of :user_id, :scope => :company_id

   

end
