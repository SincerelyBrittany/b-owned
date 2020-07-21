class Favorite < ApplicationRecord
    belongs_to :company
    belongs_to :user

     validates_uniqueness_of :user_id, :scope => :company_id
   
    # def liked?
    #     self.favorite = Favorite.where(user_id: @favorite.user_id, company_id: @favorite.company_id)
    # end

    # def like_count
    #     byebug
    #     favovite = self.liked == true
    #     favovite.count
    # end 

    # def self.liked(fav_params)
    #     if self.where(user_id: fav_params[:user_id], company_id: fav_params[:company_id]).present?
    #         word = where(user_id: fav_params[:user_id], company_id: fav_params[:company_id])
    #         if word.where("liked = true")
    #             word.update(:liked => false)
    #             @favorite = word
    #         else 
    #             word.where("liked = false")
    #             word.update(:liked => true)
    #             @favorite = word
    #         end
    #     else 
    #         self.new(fav_params)
    #     end
    # end

    # def unliked?
    #     self.liked == false
    # end 




end
