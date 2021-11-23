class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,           presence: true
  validates :birthday,           presence: true

  with_options presence: true do
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角入力してください' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角入力してください' }
    validates :last_name_reading, format: { with: /\A[ァ-ヶー]+\z/, message: 'は全角カナ入力してください' }
    validates :first_name_reading, format: { with: /\A[ァ-ヶー]+\z/, message: 'は全角カナ入力してください' }
    validates :password,
              format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i,
                        message: 'は半角英数字の混合が必須（６文字以上）です' }
  end

  has_many :items
  has_many :orders
  has_many :comments
end
