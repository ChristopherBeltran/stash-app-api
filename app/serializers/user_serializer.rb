class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email
  has_one :stream
  has_many :stashes
  has_many :articles, through: :stashes
end
