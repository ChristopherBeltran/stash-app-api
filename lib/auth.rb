require 'jwt'

class Auth

  ALGORITHM = 'HS256'
  AUTH_SECRET = Rails.application.secrets.secret_key_base.to_s

  def self.issue(payload)
    JWT.encode(
      payload,
      AUTH_SECRET,
      ALGORITHM)
  end

  def self.decode(token)
    JWT.decode(token, 
      AUTH_SECRET, 
      true, 
      { algorithm: ALGORITHM }).first
  end

  #def self.auth_secret
  #  ENV["AUTH_SECRET"]
  #end

end