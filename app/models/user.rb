class User < ActiveRecord::Base
  self.per_page = 3 #will_pagination custom

  has_many :microposts, dependent: :destroy #데이터 관계 설정

  before_save { self.email = email.downcase }
  before_create :create_remember_token

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
  			uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, length: { minimum: 6 }



    def feed
      Micropost.where("user_id=?", id) #해당 아이디가 가진 마이크로포스트 모두 가져온다.
    end

    def User.new_remember_token
      SecureRandom.urlsafe_base64
    end

    def User.encrypt(token)
      Digest::SHA1.hexdigest(token.to_s)
    end

    private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

end
