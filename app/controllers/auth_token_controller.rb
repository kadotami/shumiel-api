class AuthTokenController < ApplicationController
  def create
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      render json: command.result
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  private

  def user(email, pass)
    user = User.find_by_email(email)
    return user if user && user.authenticate(pass)

    nil
  end
end