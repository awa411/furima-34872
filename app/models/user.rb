class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i

  validates :nickname,           presence: true
  validates :last_name,          presence: true
  validates :first_name,         presence: true
  validates :last_name_kana,     presence: true
  validates :last_name_kana,     presence: true
  validates :birthday,           presence: true
  validates_format_of :password, with: PASSWORD_REGEX
  validates_format_of :last_name,         with: /([ぁ-んァ-ヶ一-龥々])+/
  validates_format_of :first_name,        with: /([ぁ-んァ-ヶ一-龥々])+/
  validates_format_of :last_name_kana,    with: /[ァ-ヶ]+/
  validates_format_of :first_name_kana,   with: /[ァ-ヶ]+/

end
