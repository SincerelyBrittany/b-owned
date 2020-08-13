class Company < ApplicationRecord
    #Validations Section
    validates :title, uniqueness: true, presence: true
    validates :phone, uniqueness: true, presence: true
    validates :email, uniqueness: true, presence: true
    validates :website, uniqueness: true, presence: true
    # validates :location, uniqueness: true

    def phone=(num)
      num.gsub!(/\D/, '') if num.is_a?(String)
      self[:phone] = num.to_i
    end

    #Users Section
    belongs_to :user,-> { where('owner == true OR admin == true') }

    #Comments Section
    has_many :comments, dependent: :destroy
    has_many :users, through: :comments
    # accepts_nested_attributes_for :comments

    #List Section
    has_many :company_lists, dependent: :destroy
    has_many :lists, through: :company_lists
    accepts_nested_attributes_for :lists

    #Favorites Section
    has_many :favorites, dependent: :destroy
    has_many :users, through: :favorites


    scope :abc, -> {order(:title)}

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
