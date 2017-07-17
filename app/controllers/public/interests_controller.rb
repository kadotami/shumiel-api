class Public::InterestsController < PublicApiController
    def index
        user_id = @current_user.id
        date = Date.today - 14
        interests = Interest.where(["user_id = ? and created_at >= ?", user_id, date])
                    .group(:name).sum(:value)
        render json: { Interest: interests }, status: 200
    end
end