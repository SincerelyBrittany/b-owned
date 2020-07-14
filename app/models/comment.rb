class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :company
    def user_name
        self.user.name
    end
end
