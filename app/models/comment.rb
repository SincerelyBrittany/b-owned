class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :company
    validates :content, presence: true, length: {maximum: 250}

    accepts_nested_attributes_for :user
    accepts_nested_attributes_for :company
    
    def user_attributes=(user_attributes)
        self.user = User.find_or_create_by(username: user_attributes[:username]) unless user_attributes[:username].blank?
    end

    def last_updated
        updated_at.strftime("Posted %m/%d/%Y")
    end

end
