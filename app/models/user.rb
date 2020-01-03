class User < ApplicationRecord
    has_many :notes, dependent: :destroy
    validates :name, uniqueness: true
end
