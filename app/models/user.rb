class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :comments
         has_many :companies, through: :comments
         has_many :favorites
         has_many :lists
         #accepts_nested_attributes_for :lists
         # def user_name
         #     self.user.name
         # end
     
         # def user_name=(name)
         #     self.user = User.find_or_create_by(name: name)
         #   end
         
         # def user_name
         #      self.user ? self.user.name : nil
         # end
     
     
         def company_name
           self.company.title
         end
       
         def company_name=(title)
           self.company = Company.find_or_create_by(title: title)
         end
        
         def comment_count
           self.comments.size
         end
         # has_many :companies, through: :commentsZZ
end
