class User < ActiveRecord::Base
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_secure_password
  validates :email, presence: true

  has_many :conversations, :foreign_key => :sender_id 

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.id).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.password = "a"
      user.email = user.uid
      user.save!
    end
  end
end
