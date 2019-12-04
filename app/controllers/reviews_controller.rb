class ReviewsController < ApplicationController
    def create
        review = Review.new(review_params)
        if review.save
            user = User.find_by(id: params[:reviewed_id])
            reviews = Review.all.filter{ |r| r.reviewed_id == params[:reviewed_id] }
            baseRating = 0
            reviews.each { |r| baseRating = baseRating + r.rating } 
            user.rating = baseRating / reviews.count
            if user.save
                render json: review
            end
        end
    end

    private

    def review_params
        params.require(:review).permit(:user_id, :reviewed_id, :rating, :content)
    end
end
