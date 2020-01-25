class User < ActiveRecord::Base
    #extend Devise::Models
    #devise :database_authenticatable, :registerable,
    #       :rememberable, :trackable, :validatable
    #include DeviseTokenAuth::Concerns::User
    has_secure_password
    has_one :stream
    has_one :stash
    #has_many :articles, through: :stashes
    validates :name, presence: true
    validates :email, presence: true
    validates :email, email: true
    validates :email, uniqueness: true
    validates :password, :length => { :minimum => 8, allow_nil: true}
    before_save :fixname
  
    def fixname
      self.name = self.name.titleize
    end

  
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

    def send_password_reset
      generate_token(:password_reset_token)
      self.password_reset_sent_at = Time.zone.now
      save!
      UserMailer.forgot_password(self).deliver# This sends an e-mail with a link for the user to reset the password
    end
    # This generates a random password reset token for the user
    def generate_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
    end


  
  end
