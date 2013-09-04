class User < ActiveRecord::Base
  has_many :microposts, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  before_save { email.downcase! }
  before_create :create_remember_token
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  has_secure_password

  # クラスメソッドnew_remember_token
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  # クラスメソッドencrypt
  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def feed
    # このコードを準備段階です。
    # 完全な実装は第11章「ユーザーをフォローする」を参照してください。
    Micropost.where("user_id = ?", id)
  end

  private
    def create_remember_token
      # トークンを作成し、インスタンス変数remember_tokenに保存する
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
