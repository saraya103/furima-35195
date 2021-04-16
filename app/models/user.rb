class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Input alphanumeric characters.' 

  with_options presence: true do
    validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    validates :last_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    validates :first_kana, format: {with: /\A[ァ-ヶ一]+\z/, message: "is invalid. Input full-width katakana characters."}
    validates :last_kana, format: {with: /\A[ァ-ヶ一]+\z/, message: "is invalid. Input full-width katakana characters."}
    validates :nickname
    validates :birthday
  end
end
