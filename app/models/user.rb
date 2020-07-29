class User < ApplicationRecord
    has_secure_password
    # validate :password_lower_case
    # validate :password_uppercase
    # validate :password_special_char
    # validate :password_contains_number
  
    # def password_uppercase
    #   return if !!password.match(/\p{Upper}/)
    #   errors.add :password, ' must contain at least 1 uppercase '
    # end
  
    # def password_lower_case
    #   return if !!password.match(/\p{Lower}/)
    #   errors.add :password, ' must contain at least 1 lowercase '
    # end
  
    # def password_special_char
    #   special = "?<>',?[]}{=-)(*&^%$#`~{}!"
    #   regex = /[#{special.gsub(/./){|char| "\\#{char}"}}]/
    #   return if password =~ regex
    #   errors.add :password, ' must contain special character'
    # end
  
    # def password_contains_number
    #   return if password.count("0-9") > 0
    #   errors.add :password, ' must contain at least one number'
    # end


    validates :username, uniqueness: true
    validates :email, uniqueness: true
    has_many :comments, dependent: :destroy
    has_many :companies, through: :comments
    has_many :favorites
    has_many :lists
    #has_many :companies,-> { where('owner == true') } || {where('admin == true')}
   
    has_many :companies#,-> { where('owner == true OR admin == true') }
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
    # has_many :companies, through: :comments
end
