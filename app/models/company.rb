class Company < ApplicationRecord
    has_many :comments
    has_many :users, through: :comments

    has_many :company_lists
    has_many :lists, through: :company_lists

    # def company_attributes=(company_attributes)
    #     company_attributes.values.each do |company_attribute|
    #       company = Company.find_or_create_by(company_attribute)
    #       self.list_companies.build(company: company)
    #     end
    #   end

    def self.search(search)
        if search
            company = Company.find_by(title: search)
            if company
                self.where(id: company)
            else 
                Company.all
            end
        else
            Company.all
        end
    end



    def comment_count
        self.comments.size
    end

    has_many :favorites
    has_many :users, through: :favorites

    def favorite_count
        self.favorites.size
    end
end
