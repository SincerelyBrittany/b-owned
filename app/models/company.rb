class Company < ApplicationRecord
    has_many :comments
    has_many :users, through: :comments
    has_many :company_lists
    has_many :lists, through: :company_lists

    def comment_count
        self.comments.size
    end

    has_many :favorites
    has_many :users, through: :favorites
    def favorite_count
        self.favorites.size
    end
end
