class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :genre_relationships, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :name, presence: true
  validates :introduction, length: {maximum: 200}
  # validates :age, numericality: {greater_than: 0}
  acts_as_paranoid
  attachment :user_image
end
