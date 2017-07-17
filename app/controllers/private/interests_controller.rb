class Private::InterestsController < PrivateApiController
    def create
        bulks = []
        interests = params[:interest]
        interests.each{|key, value|
            bulks << Interest.new(user_id: @current_user.id, name: key, value: value)
        }
        Interest.import bulks
        render json: { Interest: interests }, status: 200
    end
end