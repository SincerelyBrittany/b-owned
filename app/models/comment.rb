class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :company
    def comment_count
        self.comments.size
    end
end
