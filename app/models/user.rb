class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Input half-width alphanumeric characters.'

  with_options presence: true do
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' } do
      validates :first_name
      validates :last_name
    end
    with_options format: { with: /\A[ァ-ヶ一]+\z/, message: 'is invalid. Input full-width katakana characters.' } do
      validates :first_kana
      validates :last_kana
    end
    validates :nickname
    validates :birthday
  end

  has_many :items
end
