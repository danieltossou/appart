class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :reservations


  attr_accessor :login


  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup

    if login = conditions.delete(:login)
      where(conditions.to_hash).where("lower(email) = :value OR lower(telephone) = :value", value: login.downcase).first
    else
      where(conditions.to_hash).first
    end

  end


  def self.from_facebook(auth)

    where(facebook_id: auth.uid).first_or_create do |user|

      user.email = auth.info.email
      user.login = auth.info.name
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end


  def self.from_google_oauth2(auth)

    where(google_oauth2_id: auth.uid).first_or_create do |user|

      user.email = auth.info.email
      user.login = auth.info.name
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end

end
