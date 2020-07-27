class Company < ApplicationRecord
    #Validations Section
    # validates :title, uniqueness: true
    # validates :phone, uniqueness: true
    # validates :email, uniqueness: true
    # validates :website, uniqueness: true
    # validates :location, uniqueness: true

    #Users Section
    #  belongs_to :user
    belongs_to :user,-> { where('owner == true OR admin == true') }

    #Comments Section
    has_many :comments
    has_many :users, through: :comments
    # accepts_nested_attributes_for :comments

    #List Section
    has_many :company_lists
    has_many :lists, through: :company_lists
    accepts_nested_attributes_for :lists

    #Favorites Section
    has_many :favorites
    has_many :users, through: :favorites

    def favorite_count
        self.favorites.size
    end

    #Search Companies 
    def self.search(query)
      if query.present?
        where('TITLE like ?', "%#{query}%")
      else
        self.all
      end
    end


    def lists_attributes=(list_hash)
        list_hash.values.each do |list_attribute|
          if list_attribute[:name].present? 
            list = List.find_or_create_by(list_attribute)
            self.lists << list
          end 
        end 
      end 

 
end
