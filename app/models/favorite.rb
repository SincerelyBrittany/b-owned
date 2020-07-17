class Favorite < ApplicationRecord
    belongs_to :company
    belongs_to :user

    def favorite_count
        self.favorites.size
    end
end
