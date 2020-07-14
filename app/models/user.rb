class User < ApplicationRecord
    has_many :comments
    has_many :companies, through: :comments
    has_many :favorites
    has_many :lists
    def comment_count
        self.comments.size
    end
    def favorite_count
        self.favorites.size
    end

    def list_ids=(ids)
        ids.each do |id|
          list = List.find(id)
          self.lists << list
        end
    end
    # has_many :companies, through: :comments
end
