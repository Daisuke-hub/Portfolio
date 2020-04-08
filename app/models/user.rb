class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :genre_relationships, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :name, presence: true
  validates :introduction, length: {maximum: 300}
  validates :age, numericality: {only_integer: true}
  acts_as_paranoid
  attachment :user_image
end
