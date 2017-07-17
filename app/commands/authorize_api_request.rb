class AuthorizeApiRequest
  prepend SimpleCommand

  def initialize(headers = {}, type="")
    @headers = headers
    @type = type
  end

  def call
    if @type == "private"
        private_user
    elsif @type == "public"
        public_user
    end
  end

  private

  attr_reader :headers, :type

  def private_user
    if decoded_auth_token
      @user ||= User.find(decoded_auth_token[:user_id]) 
      if decoded_auth_token[:type] != "private"
        @user = nil
      end
    end
    @user || errors.add(:token, 'Invalid token') && nil
  end

  def public_user
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    @user || errors.add(:token, 'Invalid token') && nil
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    else
      errors.add(:token, 'Missing token')
    end
    nil
  end
end