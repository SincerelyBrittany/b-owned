class List < ApplicationRecord
    validates :name, presence: {message: "You forgot a %{attribute}"} #happen before updating a db
    
    
    #list = List.create
     #list.errors.full_messages
    belongs_to :user
    has_many :company_lists, dependent: :destroy # When you delete this list, delete all of the company_list 
    #has_many :company_lists, dependent: :delete_all
    has_many :companies, through: :company_lists
    #accepts_nested_attributes_for :companies
    def list_ids=(ids)
      ids.each do |id|
        list = List.find(id)
        self.lists << list
      end
  end
end
