class List < ApplicationRecord
    validates :name, presence: {message: "You forgot a %{attribute}"} #happen before updating a db
     #list = List.create
     #list.errors.full_messages
    belongs_to :user
    has_many :company_lists
    has_many :companies, through: :company_lists
    #accepts_nested_attributes_for :companies
    def user_name=(name)
        self.user = User.find_or_create_by(name: name)
      end
    
    def user_name
         self.user ? self.user.name : nil
    end
end
