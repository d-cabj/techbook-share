class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [:nickname]
  validates :nickname, presence: true, uniqueness: true
  has_many :purchaseHistories
  mount_uploader :profileImg, ProfileImgUploader

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value", { :value => username }]).first
    else
      where(conditions).first
    end
  end

  # #emailを不要とする
  # def email_required?
  #   false
  # end

  # def email_changed?
  #   false
  # end

end
