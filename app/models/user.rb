class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    has_secure_password
    validates :password, length: { minimum: 6 }
    validates :password_confirmation, presence: true
end
