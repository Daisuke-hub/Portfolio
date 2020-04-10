class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :genre_relationships, dependent: :destroy
  has_many :genres, through: :genre_relationships, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :name, presence: true
  validates :introduction, length: {maximum: 300}
  validates :age, numericality: {only_integer: true}, inclusion: { in: 1..200 }, allow_blank: true
  acts_as_paranoid
  attachment :user_image

  def self.search(instrument,sex,age_st,age_ed,region,level,introduction)
    if instrument.blank? == true
      search_instrument = User.all
    else
      search_instrument = User.where("instrument LIKE ?","#{instrument}")
    end

    if sex.blank? == true
      search_sex = search_instrument.all
    else
      search_sex = search_instrument.where("sex LIKE ?","#{sex}")
    end

    if region.blank? == true
      search_region = search_sex.all
    else
      search_region = search_sex.where("region LIKE ?","#{region}")
    end

    if level.blank? == true
      search_level = search_region.all
    else
      search_level = search_region.where("level LIKE ?","#{level}")
    end

    if introduction.blank? == true
      search_introduction = search_level.all
    else
      search_introduction = search_level.where("introduction LIKE ?","%#{introduction}%")
    end

    if age_st.blank? == true || age_ed.blank?
      search_age = search_introduction.all
    else
      search_age = search_introduction.where(age: age_st..age_ed)
    end

    # search_users = User.where("(instrument LIKE ?) AND (sex LIKE ?) AND (region LIKE ?) AND (introduction LIKE ?)","#{instrument}","#{sex}","#{region}","%#{introduction}%",)
  end
  
end
