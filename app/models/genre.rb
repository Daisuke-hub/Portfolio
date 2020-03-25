class Genre < ApplicationRecord
    has_many :genre_relationships, dependent: :destroy
end
