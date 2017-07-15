class PublicController < ApplicationController
  before_action :authenticate_request
  attr_reader :isvalid

  private

  def authenticate_request
    @is_valid = AuthorizeApiRequest.public_token_auth(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @is_valid
  end
end