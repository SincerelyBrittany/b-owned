class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  validate :validate_username

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  attr_writer :login

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
  
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
     
          # def owner?
          #   self.owner
          # end 

          # def user
          #   self.owner == false and self.admin == false
          # end 

          # def admin
          #   self.owner == false and self.admin == true
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
end
