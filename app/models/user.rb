class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  with_options presence: true do
    validates :nickname
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    validates :birthday
  end
  validates_format_of :password,          with: PASSWORD_REGEX
  validates_format_of :last_name,         with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  validates_format_of :first_name,        with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  validates_format_of :last_name_kana,    with: /\A[ァ-ヶ]+\z/
  validates_format_of :first_name_kana,   with: /\A[ァ-ヶ]+\z/
end
