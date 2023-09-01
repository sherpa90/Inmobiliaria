class Comuna < ApplicationRecord
    has_many :edificios, dependent: :destroy
end
