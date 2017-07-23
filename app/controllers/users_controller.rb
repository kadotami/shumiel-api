class UsersController < ApplicationController
    def create
        email = params[:email]
        password = params[:password]
        password_confirmation = params[:password_confirmation]
        user = User.new(email: email,password: password,password_confirmation: password_confirmation)
        if user.valid?
            user.save
            command = AuthenticateUser.call(params[:email], params[:password])
            render json: command.result, status: 200
        else
            render json: {error: user.errors.full_messages}, status: 400
        end
    end
end
