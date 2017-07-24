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
            JWT.encode(payload, public_secret, 'HS256')
        end

        def public_decode(token)
            body = JWT.decode(token, public_secret, 'HS256')[0]
            HashWithIndifferentAccess.new body
        rescue
            nil
        end


        private
        def secret
            return "cbehug8374gfbyAwevoHBkjUB34gu"
        end

        def public_secret
            return "98hrig8w7gUsg0tvDUgdvuygeef"
        end
    end
end