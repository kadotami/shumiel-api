class Interest < ApplicationRecord
    validates :user_id, presence: true
    validates :name, presence: true
    validates :value, presence: true
end
