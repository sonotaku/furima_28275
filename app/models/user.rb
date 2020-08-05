class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /@/ }
  # ６文字以上かつ半角英数字混合かつ２回入力
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, presence: true, with: PASSWORD_REGEX
  # 全角のみ（ひらがな、カタカナ、漢字）
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ンー-龥]/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ンー-龥]/ }
  # 全角カタカナのみ
  validates :flat_family_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :flat_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true
end
