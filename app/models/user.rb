class User < ActiveRecord::Base
    #extend Devise::Models
    #devise :database_authenticatable, :registerable,
    #       :rememberable, :trackable, :validatable
    #include DeviseTokenAuth::Concerns::User
    include Titleize
    has_secure_password
    has_one :stream
    has_many :stashes
    has_many :articles, through: :stashes
    validates :name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true
    before_save :tileize_name
    before_create :tileize_name

  
    #def self.create_user_for_google(data)                  
    #  where(uid: data["email"]).first_or_initialize.tap do |user|
    #    user.provider = "google_oauth2"
    #    user.uid = data["email"]
    #    user.name = data["given_name"] + ' ' + data["family_name"]
    #    user.email = data["email"]
    #    #user.password = Devise.friendly_token[0,20]
    #    #user.password_confirmation = user.password
    #    user.save!
    #  end
    #end
  
  end
