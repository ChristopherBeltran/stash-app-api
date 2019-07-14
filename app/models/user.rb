class User < ActiveRecord::Base
    extend Devise::Models
    devise :database_authenticatable, :registerable,
           :rememberable, :trackable, :validatable
    include DeviseTokenAuth::Concerns::User
    has_secure_password
  
    def self.create_user_for_google(data)                  
      where(uid: data["email"]).first_or_initialize.tap do |user|
        user.provider="google_oauth2"
        user.uid=data["email"]
        user.email=data["email"]
        user.password=Devise.friendly_token[0,20]
        user.password_confirmation=user.password
        user.save!
      end
    end
  
  end
