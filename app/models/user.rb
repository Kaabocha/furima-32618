class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases

  with_options presence: true do
    validates :nick_name
    validates :email
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :family_name_kana, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/ }
    validates :first_name_kana, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/ }
    validates :birthday
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  end
  validates :email, uniqueness: true
end 