class User < ApplicationRecord
    has_many :comments
    has_many :companies, through: :comments
    has_many :favorites
    has_many :lists
    #accepts_nested_attributes_for :lists
    # def user_name
    #     self.user.name
    # end

    def user_name=(name)
        self.user = User.find_or_create_by(name: name)
      end
    
    def user_name
         self.user ? self.user.name : nil
    end
   
    # has_many :companies, through: :comments
end
