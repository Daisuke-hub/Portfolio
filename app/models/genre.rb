class Genre < ApplicationRecord
    has_many :genre_relationships, dependent: :destroy
    has_many :genres, through: :genre_relationships, dependent: :destroy
end
