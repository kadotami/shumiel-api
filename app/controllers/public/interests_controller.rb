class Public::InterestsController < PublicApiController
    def index
        user_id = @current_user.id
        interests = Interest.group(:name).sum(:value).where(user_id: user_id)
        render json: { Interest: interests }, status: 200
    end
end