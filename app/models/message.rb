class Message < ApplicationRecord
    belongs_to :user
    belongs_to :room
    acts_as_paranoid

    validates :content, presence: true
end
