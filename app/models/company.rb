class Company < ApplicationRecord
    has_many :comments
    has_many :users, through: :comments

    has_many :company_lists
    has_many :lists, through: :company_lists
    accepts_nested_attributes_for :lists

    def favorite_count
        self.favorites.size
    end

    def lists_attributes=(list_hash)
        list_hash.values.each do |list_attribute|
          if list_attribute[:name].present? 
            list = List.find_or_create_by(list_attribute)
            self.lists << list
          end 
        end 
      end 

    # def self.search(search)
    #     if search
    #         company = Company.find_by(title: search)
    #         if company
    #             self.where(id: company)
    #         else 
    #             Company.all
    #         end
    #     else
    #         Company.all
    #     end
    # end
    def self.search(query)
        if query.present?
          where('TITLE like ?', "%#{query}%")
        else
          self.all
        end
      end


    has_many :favorites
    has_many :users, through: :favorites

    def favorite_count
        self.favorites.size
    end
end
