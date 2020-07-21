class CompanyList < ApplicationRecord
    belongs_to :company
    belongs_to :list

    validates_uniqueness_of :list_id, :scope => :company_id

end
