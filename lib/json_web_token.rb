class JsonWebToken
    class << self
        def encode(payload)
            payload
            JWT.encode(payload, secret, 'HS256')
        end

        def decode(token)
            body = JWT.decode(token, secret, 'HS256')[0]
            HashWithIndifferentAccess.new body
        rescue
            nil
        end

        def public_token(payload)
            payload
            JWT.encode(payload, secret, 'HS256')
        end

        private
        def secret
            return "cbehug8374gfbyuwevogu"
        end
    end
end