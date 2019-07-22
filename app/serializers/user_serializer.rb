class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email
  has_one :stream
  has_one :stash
  #has_many :articles, through: :stashes
end
