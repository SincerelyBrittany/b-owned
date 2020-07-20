class Favorite < ApplicationRecord
    belongs_to :company
    belongs_to :user

   
    # def liked?
    #     self.favorite = Favorite.where(user_id: @favorite.user_id, company_id: @favorite.company_id)
    # end

    def liked?
        self.favorite == true
    end 

    def unliked?
        self.favorite == false
    end 




end
