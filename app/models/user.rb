class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :order_users

  with_options presence: true do
    validates :nickname
    validates :password, length: { minimum: 6 }
    validates :birth_date

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: /\A[ァ-ン]+\z/ } do
      validates :last_name_kana
      validates :first_name_kana
    end

    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX
  end
end
